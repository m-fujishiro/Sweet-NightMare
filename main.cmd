@echo off
setlocal enabledelayedexpansion

@title Sweet Nightmare �`�D�����������M���Ɂ`
echo �������瓦���܂��傤�B�M��������O�ɁB&echo.

@rem ���C���V�[�P���X

@rem san:���_�� addict:�ˑ��x dist:�����Ƃ̋���
set san=50 & set addict=10 & set dist=0 & set stay_count=0
@rem dist��10�ȏ�ɂȂ�Ƌ����I�ɋߊ���Ă��ĊÂ����������Ă���

@rem �G���h����
rem addict��100�ȏ�ň����ɓM���END�@�G���h���FSweet(����)
rem san��0�ȉ��ň����̗D�����ɕ�܂��END �G���h���FSweet(�D����)
rem 10�^�[���A���ŉ��������߂���END �G���h���FSweetie(���l)
rem �����ɓ�����ꂽ(�ˑ��x��0�����_�͂�10�ȏ�)END �G���h���FBittersweet(�ق�ꂢ) 

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
echo �`��������`
echo doze:�Â���������(���_�񕜁E��/�ˑ��㏸�E��)
echo think:�h���Ă���O�����߂�(���_�񕜁E��/�ˑ������E��)
echo awake:������(���_���ՁE�ɑ�/�ˑ������E��)
echo help:�����̘b�𕷂�(��������\��/�ˑ��㏸�E��)
echo stay:�������Ȃ�(���_���ՁE��/�ˑ��㏸�E��) & echo.
set /a addict+=2 & set /a dist-=3 & set stay_count=0
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
echo �M���͂������ׂɉ߂������B & echo.
set /a san-=1 & set /a addict+=1 & set /a dist-=1 & set /a stay_count+=1
exit /b 0

:creep
echo �����Ɍ��������B�\�\�j�āA�Â��B
call :doze
exit /b 0

:doze
echo �Â����ɓM���B�h�����ӎ��̒��A�����̐������������C�������B & echo.
:doze2
set /a san+=10 & set /a addict+=10+dist & set dist=0 & set /a stay_count+=1
exit /b 0

:think
echo �����̍�����h���Ă���O�����߂�B�g�̂��N���������ŏo����̂ɁA���̗͂���A�Ȃ��B
echo ���ɏo���邱�Ƃ́A�����l���邾���B & echo.
set /a san+=3 & set /a addict-=1 & set /a dist+=1 & set /a stay_count-=1
exit /b 0

:awake
set esc=false
echo "�\�\�ǂ��֍s���񂾂��H"
set /a san-=10+addict & set /a addict-=10 & set /a dist+=5 & set stay_count=0
if %san% gtr 0 (
 choice /m �����܂����H & echo.
) else (
 :call rtn
 exit /b 0 
)
if %errorlevel% == 2 (
 :call rtn
 exit /b 0 
) 

echo "�������Ȃ���H"
set /a san-=30+addict & set /a addict-=10 & set /a dist+=8
if %san% gtr 5 (
 choice /m �����܂����H & echo.
) else (
 :call rtn
 exit /b 0 
)
if %errorlevel% == 2 (
 :call rtn
 exit /b 0 
) 

echo "�c�h���Ȃ�����߂��Ă����ŁB�\�\���[���ƁA�҂��Ă��B"
set /a san-=50+addict & set /a addict-=10 & set /a dist+=10
if %san% gtr 9 (
 choice /m �߂�܂����H & echo.
) else (
 :call rtn 
 exit /b 0 
)
if %errorlevel% == 1 (
 :call rtn 
 exit /b 0 
) 

@rem �����ɓ�����ꂽEND���Ăяo��
call bittersweet.bat
@rem �߂��Ă�����A�߂��Ă����Ƃ������ƁB�\�\��������B
call :rtn2
exit /b 0

:rtn
echo �M���̑����~�܂�B�����A�����Ȃ��B�\�\���������Ȃ��B
echo "�����A����ł����񂾂�B"
:rtn2
echo �Â����ɓM���B�����A���������Ȃ��B
call :doze2
if %san% lss 30 ( call :rtn2 )
exit /b 0 