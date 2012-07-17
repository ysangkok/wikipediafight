<?php
global $MEMO_CACHE;
$MEMO_CACHE = array();

/** Returns the result of the function with the given arguments. 
 * Invokes the function only once, thereafter returns the result 
 * cached by a key based on the function name and arguments. */
function call_memoized($fun, $args=array()) {
    global $MEMO_CACHE;

    // generate a cache key based on the function name and arguments
    $uid = md5(
        implode("|", array_merge((array)$fun, array_map(
            "serialize",
            $args)
        ))
    );

    // if there result hasn't been cached, call the function 
    // and update the cache with the result.
    if(!array_key_exists($uid, $MEMO_CACHE)) {
        $MEMO_CACHE[$uid] = call_user_func_array($fun, $args);
    }

    return $MEMO_CACHE[$uid];
}

/** Returns a memoized version of the given function that will cache 
 * its results for each unique set of inputs. */
function memoize($fun) {
    return create_function(
        '', 
        "\$args = func_get_args(); return call_memoized('$fun', \$args);"
    );
}
?>
