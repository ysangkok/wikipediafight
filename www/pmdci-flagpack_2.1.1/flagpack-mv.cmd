@echo off
IF "%1"=="" (
ECHO.
ECHO PMDCI's Flag Pack Renamer Batch File [Version 2.1.1]
ECHO.
ECHO Description:
ECHO     This script allows you to rename the flag icon files
ECHO     according to the ISO 3166-1 Alpha-2 code or the numeric
ECHO     code.
ECHO.
ECHO ERROR:
ECHO     You must specify the location containing the flag icons
ECHO     in order to proceed.
ECHO.
ECHO The syntax is:
ECHO    FLAGPACK-MV [location]
ECHO.
ECHO Example:
ECHO    FLAGPACK-MV C:\PmdciFlagPack
GOTO EOF
)

:FILECHECKA2
IF EXIST %1\flag_aa.png (
GOTO MAINMENU
) ELSE (
IF NOT EXIST %1\flag_0.png (
GOTO NOTFOUND
)
)

:MAINMENU
cls
ECHO PMDCI's Flag Pack Renamer Batch File [Version 2.1.1]
ECHO.
ECHO Description:
ECHO     This script allows you to rename the flag icon files
ECHO     according to the ISO 3166-1 Alpha-2 code or the numeric
ECHO     code.
ECHO.
ECHO Main Menu:
ECHO.
ECHO   [2]                 Rename all flag icon files following the
ECHO                       ISO 3166-1 Alpha-2 code (two-tetter country codes)
ECHO.	   
ECHO   [N]                 Rename all flag icon files following the
ECHO                       ISO 3166-1 Numerical code (two-digits country codes)
ECHO.
ECHO   [Q]                 Quit back to the command prompt (no action taken)
ECHO.
choice /c:2NQ
if ERRORLEVEL ==3 goto QUIT
if ERRORLEVEL ==2 goto NCMENU
if ERRORLEVEL ==1 goto A2MENU
goto QUIT

:A2MENU
cls
IF EXIST %1\flag_aa.png (
ECHO.
ECHO ERROR:
ECHO     It seems per the control file flag_aa.png that all flag
ECHO     icon files are already named following the ISO 3166-1
ECHO     Alpha-2 code.
ECHO.
ECHO Press any key to return to the main menu . . .
pause >nul
goto MAINMENU
) ELSE (
cls
ECHO PMDCI's Flag Pack Renamer Batch File [Version 2.1.1]
ECHO.
ECHO Description:
ECHO     You have selected the option to rename all flag icon files
ECHO     following the ISO 3166-1 Alpha-2 code.
ECHO.
ECHO ISO 3166-1 Alpha-2 code:
ECHO.
ECHO   [P]                 Proceed with renaming all flag icon files
ECHO                       following the ISO 3166-1 Alpha-2 code
ECHO.	   
ECHO   [C]                 Cancel operation and return to the main menu
ECHO.
ECHO   [Q]                 Quit back to the command prompt (no action taken)
ECHO.
choice /c:PCQ
if ERRORLEVEL ==3 goto QUIT
if ERRORLEVEL ==2 goto MAINMENU
if ERRORLEVEL ==1 goto A2MV
goto QUIT
)

:NCMENU
cls
IF EXIST %1\flag_0.png (
ECHO.
ECHO ERROR:
ECHO     It seems per the control file flag_0.png that all flag
ECHO     icon files are already named following the ISO 3166-1
ECHO     Numerical code.
ECHO.
ECHO Press any key to return to the main menu . . .
pause >nul
goto MAINMENU
) ELSE (
cls
ECHO PMDCI's Flag Pack Renamer Batch File [Version 2.1.1]
ECHO.
ECHO Description:
ECHO     You have selected the option to rename all flag icon files
ECHO     following the ISO 3166-1 Numerical code.
ECHO.
ECHO ISO 3166-1 Numerical code:
ECHO.
ECHO   [P]                 Proceed with renaming all flag icon files
ECHO                       following the ISO 3166-1 Numerical code
ECHO.	   
ECHO   [C]                 Cancel operation and return to the main menu
ECHO.
ECHO   [Q]                 Quit back to the command prompt (no action taken)
ECHO.
choice /c:PCQ
if ERRORLEVEL ==3 goto QUIT
if ERRORLEVEL ==2 goto MAINMENU
if ERRORLEVEL ==1 goto NCMV
goto QUIT
)

:A2MV
cls
ECHO.
ECHO Renaming all flag icon files following the ISO 3166-1 Alpha-2 code . . .
ren %1\flag_0.png flag_aa.png
ren %1\flag_20.png flag_ad.png
ren %1\flag_784.png flag_ae.png
ren %1\flag_4.png flag_af.png
ren %1\flag_28.png flag_ag.png
ren %1\flag_660.png flag_ai.png
ren %1\flag_8.png flag_al.png
ren %1\flag_51.png flag_am.png
ren %1\flag_24.png flag_ao.png
ren %1\flag_10.png flag_aq.png
ren %1\flag_32.png flag_ar.png
ren %1\flag_16.png flag_as.png
ren %1\flag_40.png flag_at.png
ren %1\flag_36.png flag_au.png
ren %1\flag_533.png flag_aw.png
ren %1\flag_248.png flag_ax.png
ren %1\flag_31.png flag_az.png
ren %1\flag_70.png flag_ba.png
ren %1\flag_52.png flag_bb.png
ren %1\flag_50.png flag_bd.png
ren %1\flag_56.png flag_be.png
ren %1\flag_854.png flag_bf.png
ren %1\flag_100.png flag_bg.png
ren %1\flag_48.png flag_bh.png
ren %1\flag_108.png flag_bi.png
ren %1\flag_204.png flag_bj.png
ren %1\flag_652.png flag_bl.png
ren %1\flag_60.png flag_bm.png
ren %1\flag_96.png flag_bn.png
ren %1\flag_68.png flag_bo.png
ren %1\flag_535.png flag_bq.png
ren %1\flag_76.png flag_br.png
ren %1\flag_44.png flag_bs.png
ren %1\flag_64.png flag_bt.png
ren %1\flag_74.png flag_bv.png
ren %1\flag_72.png flag_bw.png
ren %1\flag_112.png flag_by.png
ren %1\flag_84.png flag_bz.png
ren %1\flag_124.png flag_ca.png
ren %1\flag_166.png flag_cc.png
ren %1\flag_180.png flag_cd.png
ren %1\flag_140.png flag_cf.png
ren %1\flag_178.png flag_cg.png
ren %1\flag_756.png flag_ch.png
ren %1\flag_384.png flag_ci.png
ren %1\flag_184.png flag_ck.png
ren %1\flag_152.png flag_cl.png
ren %1\flag_120.png flag_cm.png
ren %1\flag_156.png flag_cn.png
ren %1\flag_170.png flag_co.png
ren %1\flag_188.png flag_cr.png
ren %1\flag_192.png flag_cu.png
ren %1\flag_132.png flag_cv.png
ren %1\flag_531.png flag_cw.png
ren %1\flag_162.png flag_cx.png
ren %1\flag_196.png flag_cy.png
ren %1\flag_203.png flag_cz.png
ren %1\flag_276.png flag_de.png
ren %1\flag_262.png flag_dj.png
ren %1\flag_208.png flag_dk.png
ren %1\flag_212.png flag_dm.png
ren %1\flag_214.png flag_do.png
ren %1\flag_12.png flag_dz.png
ren %1\flag_218.png flag_ec.png
ren %1\flag_233.png flag_ee.png
ren %1\flag_818.png flag_eg.png
ren %1\flag_732.png flag_eh.png
ren %1\flag_232.png flag_er.png
ren %1\flag_724.png flag_es.png
ren %1\flag_231.png flag_et.png
ren %1\flag_246.png flag_fi.png
ren %1\flag_242.png flag_fj.png
ren %1\flag_238.png flag_fk.png
ren %1\flag_583.png flag_fm.png
ren %1\flag_234.png flag_fo.png
ren %1\flag_250.png flag_fr.png
ren %1\flag_266.png flag_ga.png
ren %1\flag_826.png flag_gb.png
ren %1\flag_308.png flag_gd.png
ren %1\flag_268.png flag_ge.png
ren %1\flag_254.png flag_gf.png
ren %1\flag_831.png flag_gg.png
ren %1\flag_288.png flag_gh.png
ren %1\flag_292.png flag_gi.png
ren %1\flag_304.png flag_gl.png
ren %1\flag_270.png flag_gm.png
ren %1\flag_324.png flag_gn.png
ren %1\flag_312.png flag_gp.png
ren %1\flag_226.png flag_gq.png
ren %1\flag_300.png flag_gr.png
ren %1\flag_239.png flag_gs.png
ren %1\flag_320.png flag_gt.png
ren %1\flag_316.png flag_gu.png
ren %1\flag_624.png flag_gw.png
ren %1\flag_328.png flag_gy.png
ren %1\flag_344.png flag_hk.png
ren %1\flag_334.png flag_hm.png
ren %1\flag_340.png flag_hn.png
ren %1\flag_191.png flag_hr.png
ren %1\flag_332.png flag_ht.png
ren %1\flag_348.png flag_hu.png
ren %1\flag_360.png flag_id.png
ren %1\flag_372.png flag_ie.png
ren %1\flag_376.png flag_il.png
ren %1\flag_833.png flag_im.png
ren %1\flag_356.png flag_in.png
ren %1\flag_86.png flag_io.png
ren %1\flag_368.png flag_iq.png
ren %1\flag_364.png flag_ir.png
ren %1\flag_352.png flag_is.png
ren %1\flag_380.png flag_it.png
ren %1\flag_832.png flag_je.png
ren %1\flag_388.png flag_jm.png
ren %1\flag_400.png flag_jo.png
ren %1\flag_392.png flag_jp.png
ren %1\flag_404.png flag_ke.png
ren %1\flag_417.png flag_kg.png
ren %1\flag_116.png flag_kh.png
ren %1\flag_296.png flag_ki.png
ren %1\flag_174.png flag_km.png
ren %1\flag_659.png flag_kn.png
ren %1\flag_408.png flag_kp.png
ren %1\flag_410.png flag_kr.png
ren %1\flag_414.png flag_kw.png
ren %1\flag_136.png flag_ky.png
ren %1\flag_398.png flag_kz.png
ren %1\flag_418.png flag_la.png
ren %1\flag_422.png flag_lb.png
ren %1\flag_662.png flag_lc.png
ren %1\flag_438.png flag_li.png
ren %1\flag_144.png flag_lk.png
ren %1\flag_430.png flag_lr.png
ren %1\flag_426.png flag_ls.png
ren %1\flag_440.png flag_lt.png
ren %1\flag_442.png flag_lu.png
ren %1\flag_428.png flag_lv.png
ren %1\flag_434.png flag_ly.png
ren %1\flag_504.png flag_ma.png
ren %1\flag_492.png flag_mc.png
ren %1\flag_498.png flag_md.png
ren %1\flag_499.png flag_me.png
ren %1\flag_663.png flag_mf.png
ren %1\flag_450.png flag_mg.png
ren %1\flag_584.png flag_mh.png
ren %1\flag_807.png flag_mk.png
ren %1\flag_466.png flag_ml.png
ren %1\flag_104.png flag_mm.png
ren %1\flag_496.png flag_mn.png
ren %1\flag_446.png flag_mo.png
ren %1\flag_580.png flag_mp.png
ren %1\flag_474.png flag_mq.png
ren %1\flag_478.png flag_mr.png
ren %1\flag_500.png flag_ms.png
ren %1\flag_470.png flag_mt.png
ren %1\flag_480.png flag_mu.png
ren %1\flag_462.png flag_mv.png
ren %1\flag_454.png flag_mw.png
ren %1\flag_484.png flag_mx.png
ren %1\flag_458.png flag_my.png
ren %1\flag_508.png flag_mz.png
ren %1\flag_516.png flag_na.png
ren %1\flag_540.png flag_nc.png
ren %1\flag_562.png flag_ne.png
ren %1\flag_574.png flag_nf.png
ren %1\flag_566.png flag_ng.png
ren %1\flag_558.png flag_ni.png
ren %1\flag_528.png flag_nl.png
ren %1\flag_578.png flag_no.png
ren %1\flag_524.png flag_np.png
ren %1\flag_520.png flag_nr.png
ren %1\flag_570.png flag_nu.png
ren %1\flag_554.png flag_nz.png
ren %1\flag_512.png flag_om.png
ren %1\flag_591.png flag_pa.png
ren %1\flag_604.png flag_pe.png
ren %1\flag_258.png flag_pf.png
ren %1\flag_598.png flag_pg.png
ren %1\flag_608.png flag_ph.png
ren %1\flag_586.png flag_pk.png
ren %1\flag_616.png flag_pl.png
ren %1\flag_666.png flag_pm.png
ren %1\flag_612.png flag_pn.png
ren %1\flag_630.png flag_pr.png
ren %1\flag_275.png flag_ps.png
ren %1\flag_620.png flag_pt.png
ren %1\flag_585.png flag_pw.png
ren %1\flag_600.png flag_py.png
ren %1\flag_634.png flag_qa.png
ren %1\flag_638.png flag_re.png
ren %1\flag_642.png flag_ro.png
ren %1\flag_688.png flag_rs.png
ren %1\flag_643.png flag_ru.png
ren %1\flag_646.png flag_rw.png
ren %1\flag_682.png flag_sa.png
ren %1\flag_90.png flag_sb.png
ren %1\flag_690.png flag_sc.png
ren %1\flag_729.png flag_sd.png
ren %1\flag_752.png flag_se.png
ren %1\flag_702.png flag_sg.png
ren %1\flag_654.png flag_sh.png
ren %1\flag_705.png flag_si.png
ren %1\flag_744.png flag_sj.png
ren %1\flag_703.png flag_sk.png
ren %1\flag_694.png flag_sl.png
ren %1\flag_674.png flag_sm.png
ren %1\flag_686.png flag_sn.png
ren %1\flag_706.png flag_so.png
ren %1\flag_740.png flag_sr.png
ren %1\flag_728.png flag_ss.png
ren %1\flag_678.png flag_st.png
ren %1\flag_222.png flag_sv.png
ren %1\flag_534.png flag_sx.png
ren %1\flag_760.png flag_sy.png
ren %1\flag_748.png flag_sz.png
ren %1\flag_796.png flag_tc.png
ren %1\flag_148.png flag_td.png
ren %1\flag_260.png flag_tf.png
ren %1\flag_768.png flag_tg.png
ren %1\flag_764.png flag_th.png
ren %1\flag_762.png flag_tj.png
ren %1\flag_772.png flag_tk.png
ren %1\flag_626.png flag_tl.png
ren %1\flag_795.png flag_tm.png
ren %1\flag_788.png flag_tn.png
ren %1\flag_776.png flag_to.png
ren %1\flag_792.png flag_tr.png
ren %1\flag_780.png flag_tt.png
ren %1\flag_798.png flag_tv.png
ren %1\flag_158.png flag_tw.png
ren %1\flag_834.png flag_tz.png
ren %1\flag_804.png flag_ua.png
ren %1\flag_800.png flag_ug.png
ren %1\flag_581.png flag_um.png
ren %1\flag_840.png flag_us.png
ren %1\flag_858.png flag_uy.png
ren %1\flag_860.png flag_uz.png
ren %1\flag_336.png flag_va.png
ren %1\flag_670.png flag_vc.png
ren %1\flag_862.png flag_ve.png
ren %1\flag_92.png flag_vg.png
ren %1\flag_850.png flag_vi.png
ren %1\flag_704.png flag_vn.png
ren %1\flag_548.png flag_vu.png
ren %1\flag_876.png flag_wf.png
ren %1\flag_882.png flag_ws.png
ren %1\flag_887.png flag_ye.png
ren %1\flag_175.png flag_yt.png
ren %1\flag_710.png flag_za.png
ren %1\flag_894.png flag_zm.png
ren %1\flag_716.png flag_zw.png
ECHO.
ECHO Renaming process completed. Press any key to return to the main menu . . . 
pause >nul
GOTO MAINMENU

:NCMV
cls
ECHO.
ECHO Renaming all flag icon files following the ISO 3166-1 Numerical code . . .
ren %1\flag_aa.png flag_0.png
ren %1\flag_ad.png flag_20.png
ren %1\flag_ae.png flag_784.png
ren %1\flag_af.png flag_4.png
ren %1\flag_ag.png flag_28.png
ren %1\flag_ai.png flag_660.png
ren %1\flag_al.png flag_8.png
ren %1\flag_am.png flag_51.png
ren %1\flag_ao.png flag_24.png
ren %1\flag_aq.png flag_10.png
ren %1\flag_ar.png flag_32.png
ren %1\flag_as.png flag_16.png
ren %1\flag_at.png flag_40.png
ren %1\flag_au.png flag_36.png
ren %1\flag_aw.png flag_533.png
ren %1\flag_ax.png flag_248.png
ren %1\flag_az.png flag_31.png
ren %1\flag_ba.png flag_70.png
ren %1\flag_bb.png flag_52.png
ren %1\flag_bd.png flag_50.png
ren %1\flag_be.png flag_56.png
ren %1\flag_bf.png flag_854.png
ren %1\flag_bg.png flag_100.png
ren %1\flag_bh.png flag_48.png
ren %1\flag_bi.png flag_108.png
ren %1\flag_bj.png flag_204.png
ren %1\flag_bl.png flag_652.png
ren %1\flag_bm.png flag_60.png
ren %1\flag_bn.png flag_96.png
ren %1\flag_bo.png flag_68.png
ren %1\flag_bq.png flag_535.png
ren %1\flag_br.png flag_76.png
ren %1\flag_bs.png flag_44.png
ren %1\flag_bt.png flag_64.png
ren %1\flag_bv.png flag_74.png
ren %1\flag_bw.png flag_72.png
ren %1\flag_by.png flag_112.png
ren %1\flag_bz.png flag_84.png
ren %1\flag_ca.png flag_124.png
ren %1\flag_cc.png flag_166.png
ren %1\flag_cd.png flag_180.png
ren %1\flag_cf.png flag_140.png
ren %1\flag_cg.png flag_178.png
ren %1\flag_ch.png flag_756.png
ren %1\flag_ci.png flag_384.png
ren %1\flag_ck.png flag_184.png
ren %1\flag_cl.png flag_152.png
ren %1\flag_cm.png flag_120.png
ren %1\flag_cn.png flag_156.png
ren %1\flag_co.png flag_170.png
ren %1\flag_cr.png flag_188.png
ren %1\flag_cu.png flag_192.png
ren %1\flag_cv.png flag_132.png
ren %1\flag_cw.png flag_531.png
ren %1\flag_cx.png flag_162.png
ren %1\flag_cy.png flag_196.png
ren %1\flag_cz.png flag_203.png
ren %1\flag_de.png flag_276.png
ren %1\flag_dj.png flag_262.png
ren %1\flag_dk.png flag_208.png
ren %1\flag_dm.png flag_212.png
ren %1\flag_do.png flag_214.png
ren %1\flag_dz.png flag_12.png
ren %1\flag_ec.png flag_218.png
ren %1\flag_ee.png flag_233.png
ren %1\flag_eg.png flag_818.png
ren %1\flag_eh.png flag_732.png
ren %1\flag_er.png flag_232.png
ren %1\flag_es.png flag_724.png
ren %1\flag_et.png flag_231.png
ren %1\flag_fi.png flag_246.png
ren %1\flag_fj.png flag_242.png
ren %1\flag_fk.png flag_238.png
ren %1\flag_fm.png flag_583.png
ren %1\flag_fo.png flag_234.png
ren %1\flag_fr.png flag_250.png
ren %1\flag_ga.png flag_266.png
ren %1\flag_gb.png flag_826.png
ren %1\flag_gd.png flag_308.png
ren %1\flag_ge.png flag_268.png
ren %1\flag_gf.png flag_254.png
ren %1\flag_gg.png flag_831.png
ren %1\flag_gh.png flag_288.png
ren %1\flag_gi.png flag_292.png
ren %1\flag_gl.png flag_304.png
ren %1\flag_gm.png flag_270.png
ren %1\flag_gn.png flag_324.png
ren %1\flag_gp.png flag_312.png
ren %1\flag_gq.png flag_226.png
ren %1\flag_gr.png flag_300.png
ren %1\flag_gs.png flag_239.png
ren %1\flag_gt.png flag_320.png
ren %1\flag_gu.png flag_316.png
ren %1\flag_gw.png flag_624.png
ren %1\flag_gy.png flag_328.png
ren %1\flag_hk.png flag_344.png
ren %1\flag_hm.png flag_334.png
ren %1\flag_hn.png flag_340.png
ren %1\flag_hr.png flag_191.png
ren %1\flag_ht.png flag_332.png
ren %1\flag_hu.png flag_348.png
ren %1\flag_id.png flag_360.png
ren %1\flag_ie.png flag_372.png
ren %1\flag_il.png flag_376.png
ren %1\flag_im.png flag_833.png
ren %1\flag_in.png flag_356.png
ren %1\flag_io.png flag_86.png
ren %1\flag_iq.png flag_368.png
ren %1\flag_ir.png flag_364.png
ren %1\flag_is.png flag_352.png
ren %1\flag_it.png flag_380.png
ren %1\flag_je.png flag_832.png
ren %1\flag_jm.png flag_388.png
ren %1\flag_jo.png flag_400.png
ren %1\flag_jp.png flag_392.png
ren %1\flag_ke.png flag_404.png
ren %1\flag_kg.png flag_417.png
ren %1\flag_kh.png flag_116.png
ren %1\flag_ki.png flag_296.png
ren %1\flag_km.png flag_174.png
ren %1\flag_kn.png flag_659.png
ren %1\flag_kp.png flag_408.png
ren %1\flag_kr.png flag_410.png
ren %1\flag_kw.png flag_414.png
ren %1\flag_ky.png flag_136.png
ren %1\flag_kz.png flag_398.png
ren %1\flag_la.png flag_418.png
ren %1\flag_lb.png flag_422.png
ren %1\flag_lc.png flag_662.png
ren %1\flag_li.png flag_438.png
ren %1\flag_lk.png flag_144.png
ren %1\flag_lr.png flag_430.png
ren %1\flag_ls.png flag_426.png
ren %1\flag_lt.png flag_440.png
ren %1\flag_lu.png flag_442.png
ren %1\flag_lv.png flag_428.png
ren %1\flag_ly.png flag_434.png
ren %1\flag_ma.png flag_504.png
ren %1\flag_mc.png flag_492.png
ren %1\flag_md.png flag_498.png
ren %1\flag_me.png flag_499.png
ren %1\flag_mf.png flag_663.png
ren %1\flag_mg.png flag_450.png
ren %1\flag_mh.png flag_584.png
ren %1\flag_mk.png flag_807.png
ren %1\flag_ml.png flag_466.png
ren %1\flag_mm.png flag_104.png
ren %1\flag_mn.png flag_496.png
ren %1\flag_mo.png flag_446.png
ren %1\flag_mp.png flag_580.png
ren %1\flag_mq.png flag_474.png
ren %1\flag_mr.png flag_478.png
ren %1\flag_ms.png flag_500.png
ren %1\flag_mt.png flag_470.png
ren %1\flag_mu.png flag_480.png
ren %1\flag_mv.png flag_462.png
ren %1\flag_mw.png flag_454.png
ren %1\flag_mx.png flag_484.png
ren %1\flag_my.png flag_458.png
ren %1\flag_mz.png flag_508.png
ren %1\flag_na.png flag_516.png
ren %1\flag_nc.png flag_540.png
ren %1\flag_ne.png flag_562.png
ren %1\flag_nf.png flag_574.png
ren %1\flag_ng.png flag_566.png
ren %1\flag_ni.png flag_558.png
ren %1\flag_nl.png flag_528.png
ren %1\flag_no.png flag_578.png
ren %1\flag_np.png flag_524.png
ren %1\flag_nr.png flag_520.png
ren %1\flag_nu.png flag_570.png
ren %1\flag_nz.png flag_554.png
ren %1\flag_om.png flag_512.png
ren %1\flag_pa.png flag_591.png
ren %1\flag_pe.png flag_604.png
ren %1\flag_pf.png flag_258.png
ren %1\flag_pg.png flag_598.png
ren %1\flag_ph.png flag_608.png
ren %1\flag_pk.png flag_586.png
ren %1\flag_pl.png flag_616.png
ren %1\flag_pm.png flag_666.png
ren %1\flag_pn.png flag_612.png
ren %1\flag_pr.png flag_630.png
ren %1\flag_ps.png flag_275.png
ren %1\flag_pt.png flag_620.png
ren %1\flag_pw.png flag_585.png
ren %1\flag_py.png flag_600.png
ren %1\flag_qa.png flag_634.png
ren %1\flag_re.png flag_638.png
ren %1\flag_ro.png flag_642.png
ren %1\flag_rs.png flag_688.png
ren %1\flag_ru.png flag_643.png
ren %1\flag_rw.png flag_646.png
ren %1\flag_sa.png flag_682.png
ren %1\flag_sb.png flag_90.png
ren %1\flag_sc.png flag_690.png
ren %1\flag_sd.png flag_729.png
ren %1\flag_se.png flag_752.png
ren %1\flag_sg.png flag_702.png
ren %1\flag_sh.png flag_654.png
ren %1\flag_si.png flag_705.png
ren %1\flag_sj.png flag_744.png
ren %1\flag_sk.png flag_703.png
ren %1\flag_sl.png flag_694.png
ren %1\flag_sm.png flag_674.png
ren %1\flag_sn.png flag_686.png
ren %1\flag_so.png flag_706.png
ren %1\flag_sr.png flag_740.png
ren %1\flag_ss.png flag_728.png
ren %1\flag_st.png flag_678.png
ren %1\flag_sv.png flag_222.png
ren %1\flag_sx.png flag_534.png
ren %1\flag_sy.png flag_760.png
ren %1\flag_sz.png flag_748.png
ren %1\flag_tc.png flag_796.png
ren %1\flag_td.png flag_148.png
ren %1\flag_tf.png flag_260.png
ren %1\flag_tg.png flag_768.png
ren %1\flag_th.png flag_764.png
ren %1\flag_tj.png flag_762.png
ren %1\flag_tk.png flag_772.png
ren %1\flag_tl.png flag_626.png
ren %1\flag_tm.png flag_795.png
ren %1\flag_tn.png flag_788.png
ren %1\flag_to.png flag_776.png
ren %1\flag_tr.png flag_792.png
ren %1\flag_tt.png flag_780.png
ren %1\flag_tv.png flag_798.png
ren %1\flag_tw.png flag_158.png
ren %1\flag_tz.png flag_834.png
ren %1\flag_ua.png flag_804.png
ren %1\flag_ug.png flag_800.png
ren %1\flag_um.png flag_581.png
ren %1\flag_us.png flag_840.png
ren %1\flag_uy.png flag_858.png
ren %1\flag_uz.png flag_860.png
ren %1\flag_va.png flag_336.png
ren %1\flag_vc.png flag_670.png
ren %1\flag_ve.png flag_862.png
ren %1\flag_vg.png flag_92.png
ren %1\flag_vi.png flag_850.png
ren %1\flag_vn.png flag_704.png
ren %1\flag_vu.png flag_548.png
ren %1\flag_wf.png flag_876.png
ren %1\flag_ws.png flag_882.png
ren %1\flag_ye.png flag_887.png
ren %1\flag_yt.png flag_175.png
ren %1\flag_za.png flag_710.png
ren %1\flag_zm.png flag_894.png
ren %1\flag_zw.png flag_716.png
ECHO.
ECHO Renaming process completed. Press any key to return to the main menu . . . 
pause >nul
GOTO MAINMENU

:NOTFOUND
ECHO.
ECHO No control file was found in the specified location.
ECHO No further action taken. Returning to the Command Prompt.
GOTO EOF

:QUIT
ECHO.
ECHO Option Selected: [Q]
ECHO No further action taken. Returning to the Command Prompt.
GOTO EOF

:EOF