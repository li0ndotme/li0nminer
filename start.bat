@ECHO OFF
color 0c
:start
ECHO.
ECHO ======PRESS ANY KEY TO CONTINUE======
ECHO.
ECHO       MADE BY LI0N. VERSION 1.0
ECHO.
ECHO     github.com/li0ndotme/li0nminer
ECHO.
ECHO           DONATIONS WELCOME
ECHO 0xa054E87795015b5cab113cE6727E5962C38146fa
ECHO.
ECHO ======PRESS ANY KEY TO CONTINUE======
PAUSE > NUL
CLS
:MENULOAD
ECHO ============LOADING MENU=============
ECHO.
ECHO 1.  LOAD CONFIG.SAV
ECHO.
ECHO 2.  NEW COFIG
ECHO.
ECHO ==========PRESS 'Q' TO QUIT==========
ECHO.
SET INPUT=
SET /P INPUT=Please select a number:
IF /I '%INPUT%'=='1' GOTO Load
IF /I '%INPUT%'=='2' GOTO New
IF /I '%INPUT%'=='Q' GOTO Quit
PAUSE > NUL
CLS
:Load
< config.sav (
  set /p server=
  set /p eth=
  set /p heap=
  set /p name=
  set /p gpu=
  set /p single=
)
ECHO ==========CONFIG.SAV LOADED==========
ECHO.
ECHO ======PRESS ANY KEY TO CONTINUE======
PAUSE > NUL
GOTO MENU
:New
CLS
ECHO MINING CONFIG. HIT ENTER AFTER ENTRY.
set /p server="Ethermine.org server? ex. us1.ethermine.org:4444 or us1.ethermine.org:14444  :"
set /p eth="Enter your ETH address. ex. 0xa054E87795015b5cab113cE6727E5962C38146fa  :"
set /p name="Enter your computer name. ex. Computer01  :"
set /p heap="Enter your GPU_MAX_HEAP_SIZE. ex. 100 :"
set /p gpu="Enter your GPU_MAX_ALLOC_PERCENT. ex. 99  :"
set /p single="Enter your GPU_SINGLE_ALLOC_PERCENT. ex. 99  :"
:choice
set /P c=Are these details correct? (Y/N)
if /I "%c%" EQU "N" goto :start
if /I "%c%" EQU "Y" goto :next
goto :choice
:next
(
  echo server=%server%
  echo eth=%name%
  echo heap=%eth%
  echo name=%heap%
  echo gpu=%gpu%
  echo single=%single%
) > config.sav
ECHO.
ECHO ======PRESS ANY KEY TO CONTINUE======
PAUSE > NUL
GOTO MENU
:MENU
CLS
ECHO ==========LI0N MINING MENU===========
ECHO.
ECHO 1.  START MINING
ECHO.
ECHO 2.  VIEW CONFIG
ECHO.
ECHO ==========PRESS 'Q' TO QUIT==========
ECHO.
SET INPUT=
SET /P INPUT=Please select a number:
IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='Q' GOTO Quit
CLS
ECHO ============INVALID INPUT============
ECHO -------------------------------------
ECHO Please select a number from the Main
echo Menu [1-9] or select 'Q' to quit.
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======
PAUSE > NUL
GOTO MENU
:Selection1
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE %heap%
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT %gpu%
setx GPU_SINGLE_ALLOC_PERCENT %single%
EthDcrMiner64.exe -epool %server% -ewal %eth%.%name% -epsw x
:Selection2
ECHO setx GPU_FORCE_64BIT_PTR 0
ECHO setx GPU_MAX_HEAP_SIZE %heap%
ECHO setx GPU_USE_SYNC_OBJECTS 1
ECHO setx GPU_MAX_ALLOC_PERCENT %gpu%
ECHO setx GPU_SINGLE_ALLOC_PERCENT %single%
ECHO EthDcrMiner64.exe -epool %server% -ewal %eth%.%name% -epsw x
ECHO.
ECHO ======PRESS ANY KEY TO CONTINUE======
PAUSE > NUL
GOTO MENU