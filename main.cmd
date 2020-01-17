@echo off
setlocal enabledelayedexpansion

@title Sweet Nightmare ～優しい悪夢を貴女に～
echo 悪魔から逃げましょう。貴女が壊れる前に。&echo.

@rem メインシーケンス

@rem san:精神力 addict:依存度 dist:悪魔との距離
set san=50 & set addict=10 & set dist=0 & set stay_count=0
@rem distが10以上になると強制的に近寄ってきて甘い夢を見せてくる

@rem エンド分岐
rem addictが100以上で悪夢に溺れるEND　エンド名：Sweet(麻薬)
rem sanが0以下で悪魔の優しさに包まれるEND エンド名：Sweet(優しさ)
rem 10ターン連続で何もせず過ごすEND エンド名：Sweetie(恋人)
rem 無事に逃げられた(依存度が0且つ精神力が10以上)END エンド名：Bittersweet(ほろ苦い) 

call :help

:main
set /p user="command:"
echo.
set is_true=false
if %user% == doze ( set is_true=true )
if %user% == think ( set is_true=true )
if %user% == awake  ( set is_true=true )
if %user% == help ( set is_true=true )
if %is_true% == true (call :%user%) else ( call :stay ) 

@rem echo san=%san%, addict=%addict%, dist=%dist%

if %dist% geq 10 ( call :creep )
if %addict% geq 100 ( call sweet1.bat )
if %san% leq 0 ( call sweet2.bat )
if %stay_count% geq 10 (call sweetie.bat)
call :main

:help
call :rule
echo ～操作説明～
echo doze:甘い夢を見る(精神回復・大/依存上昇・小)
echo think:揺り籠から外を見つめる(精神回復・小/依存減少・微)
echo awake:逃げる(精神消耗・極大/依存減少・中)
echo help:悪魔の話を聞く(操作説明表示/依存上昇・微)
echo stay:何もしない(精神消耗・微/依存上昇・微) & echo.
set /a addict+=2 & set /a dist-=3 & set stay_count=0
exit /b 0
:rule
echo ～揺り籠の規則～
echo その1：外に出てはいけないよ。
echo その2：ずっと甘い夢を見ているんだ。ずーっと、永遠にね。
echo その3：もし破ったら、辛い思いをすることになるよ。
echo その4：ニガサナイ
echo その5：君はもう、僕なしでは生きていけないんだ。
echo その6：――たとえ君が逃げても、また戻って来るまでずっと待ってるよ。&echo.
exit /b 0

:stay
echo 貴女はただ無為に過ごした。 & echo.
set /a san-=1 & set /a addict+=1 & set /a dist-=1 & set /a stay_count+=1
exit /b 0

:creep
echo 悪魔に見つかった。――嗚呼、甘い。
call :doze
exit /b 0

:doze
echo 甘い夢に溺れる。揺蕩う意識の中、悪魔の声が聞こえた気がした。 & echo.
:doze2
set /a san+=10 & set /a addict+=10+dist & set dist=0 & set /a stay_count+=1
exit /b 0

:think
echo 悪魔の作った揺り籠から外を見つめる。身体を起こすだけで出られるのに、その力すら、ない。
echo 私に出来ることは、ただ考えるだけ。 & echo.
set /a san+=3 & set /a addict-=1 & set /a dist+=1 & set /a stay_count-=1
exit /b 0

:awake
set esc=false
echo "――どこへ行くんだい？"
set /a san-=10+addict & set /a addict-=10 & set /a dist+=5 & set stay_count=0
if %san% gtr 0 (
 choice /m 逃げますか？ & echo.
) else (
 :call rtn
 exit /b 0 
)
if %errorlevel% == 2 (
 :call rtn
 exit /b 0 
) 

echo "逃がさないよ？"
set /a san-=30+addict & set /a addict-=10 & set /a dist+=8
if %san% gtr 5 (
 choice /m 逃げますか？ & echo.
) else (
 :call rtn
 exit /b 0 
)
if %errorlevel% == 2 (
 :call rtn
 exit /b 0 
) 

echo "…辛くなったら戻っておいで。――ずーっと、待ってるよ。"
set /a san-=50+addict & set /a addict-=10 & set /a dist+=10
if %san% gtr 9 (
 choice /m 戻りますか？ & echo.
) else (
 :call rtn 
 exit /b 0 
)
if %errorlevel% == 1 (
 :call rtn 
 exit /b 0 
) 

@rem 無事に逃げられたENDを呼び出す
call bittersweet.bat
@rem 戻ってきたら、戻ってきたということ。――おかえり。
call :rtn2
exit /b 0

:rtn
echo 貴女の足が止まる。もう、動けない。――動きたくない。
echo "そう、それでいいんだよ。"
:rtn2
echo 甘い夢に溺れる。もう、動きたくない。
call :doze2
if %san% lss 30 ( call :rtn2 )
exit /b 0 