import csv
import urllib2
import json
from BeautifulSoup import BeautifulSoup

opener = urllib2.build_opener()
opener.addheaders = [('User-agent', 'Mozilla/5.0')]

url = 'http://en.wikipedia.org/wiki/ISO_3166-1'

page = opener.open(url)
soup = BeautifulSoup(page.read())

t = soup.find('table', {'class' : 'wikitable sortable'})

def getpairs():
  # Iterate over the table pulling out the country table results. Skip the first 
  # row as it contains the already-parsed header information.
  for row in t.findAll("tr")[1:]:
    tds = row.findAll('td')
    raw_cols = [td.findAll(text=True) for td in tds]
    cols = []
    # country field contains differing numbers of elements, due to the flag -- 
    # only take the name
    cols.append(raw_cols[0][-1:][0])
    # for all other columns, use the first result text
    cols.extend([col[0] for col in raw_cols[1:]])
    yield (cols[1], cols)

print json.dumps(dict(list(getpairs())))
