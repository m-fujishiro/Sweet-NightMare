@rem echo off
setlocal enabledelayedexpansion

title Sweet Nightmare �`�D�����������M���Ɂ`
echo �������瓦���܂��傤�B�M��������O�ɁB&echo.

@rem ���C���V�[�P���X
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

for /f "delims=," %%a IN (%errorlevel%) do(
  set san=%%a
  set addict=%%b
  set dist=%%c
)

echo san=%san%, addict=%addict%, dist=%dist%
pause
exit /b 0

:help
call :rule
echo �`��������`
echo doze:�Â���������(���_�񕜁E��/�ˑ��㏸�E��)
echo think:�h���Ă���O�����߂�(���_�񕜁E��/�ˑ������E��)
echo awake:������(���_���ՁE�ɑ�/�ˑ������E��)
echo help:�����̘b�𕷂�(��������\��/�ˑ��㏸�E��)
echo stay:�������Ȃ�(���_���ՁE��/�ˑ��㏸�E��)&echo.
exit /b 0
:rule
echo �`�h���Ă̋K���`
echo ����1�F�O�ɏo�Ă͂����Ȃ���B
echo ����2�F�����ƊÂ��������Ă���񂾁B���[���ƁA�i���ɂˁB
echo ����3�F�����j������A�h���v�������邱�ƂɂȂ��B
echo ����4�F�j�K�T�i�C
echo ����5�F�N�͂����A�l�Ȃ��ł͐����Ă����Ȃ��񂾁B
echo ����6�F�\�\���Ƃ��N�������Ă��A�܂��߂��ė���܂ł����Ƒ҂��Ă��B&echo.
exit /b 0

:stay
set /a rtn1=san-1 & set /a rtn2=addict+1 & set /a rtn3=dist-1
exit /b %rtn1%,%rtn2%,%rtn3%