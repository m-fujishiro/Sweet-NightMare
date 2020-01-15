@rem echo off
setlocal enabledelayedexpansion

title Sweet Nightmare ～優しい悪夢を貴女に～
echo 悪魔から逃げましょう。貴女が壊れる前に。&echo.

@rem メインシーケンス
set is_fin=false & set san=50 & set addict=10 & set dist=10

call :help

set /p user=""
echo %user%

set is_true=false
if %user% == doze (set is_true=true)
if %user% == think (set is_true=true)
if %user% == awake  (set is_true=true)
if %user% == help (set is_true=true)
if %is_true% == true (call :%user%) else (call :stay) 

echo san=%san%, addict=%addict%, dist=%dist%
pause
exit /b 0

:help
call :rule
echo ～操作説明～
echo doze:甘い夢を見る(精神回復・大/依存上昇・小)
echo think:揺り籠から外を見つめる(精神回復・小/依存減少・微)
echo awake:逃げる(精神消耗・極大/依存減少・中)
echo help:悪魔の話を聞く(操作説明表示/依存上昇・微)
echo stay:何もしない(精神消耗・微/依存上昇・微)&echo.
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
echo 貴女はただ無為に過ごした。
set /a san=san-1 & set /a addict=addict+1 & set /a dist=dist-1
exit /b 0