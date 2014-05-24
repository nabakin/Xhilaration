@echo off
title Xhilaration
rem if not exist "Z:\" goto net
:menu
if not exist "%appdata%\Xhilaration" (
mkdir "%appdata%\Xhilaration"
xcopy "colous.exe" "%appdata%\Xhilaration"
)
cd "%appdata%\Xhilaration"
title Xhilaration - Menu
mode con cols=28lines=10
cls
echo  É                        »
echo.
colous 12 0 10,2 "Xhilaration"
echo.
echo.
echo    1.) Login
echo    2.) New Account
echo    3.) Controls
echo    4.) Credits
echo    5.) Exit
echo  È                        ¼
choice /c 12345 >NUL
if %errorlevel% == 1 goto login
if %errorlevel% == 2 goto newacc
if %errorlevel% == 3 goto controls
if %errorlevel% == 4 goto credits
if %errorlevel% == 5 exit
goto menu

:newacc
cls
title Xhilaration - Create an Account
echo.
echo  What do you want your name  to be?
echo.
echo  1.) Return
echo.
set /p usern=">"
if "%usern%" == "1" goto menu
echo.
echo What do you want your        password to be?
echo.
echo  1.) Return
echo.
set /p passn=">"
if "%passn%" == "1" goto menu
cd "%appdata%\Xhilaration"
if not exist "Users" mkdir "Users"
if exist "Users\%usern%" goto userexist
mkdir "Users\%usern%"
cd "%appdata%\Xhilaration\Users\%usern%"
echo %passn%> "pass.dat"
ATTRIB +H "pass.dat"
set accn=%usern%
echo.
echo Account created successfully!
echo.
pause >NUL
goto pmenu

:userexist
cls
echo.
echo Account %usern% already exists.
echo.
pause >NUL
goto newacc

:login
cls
title Xhilaration - Login
echo.
echo  What is your account name?
echo.
echo  1.) Return
echo.
set /p accn=">"
if "%accn%" == "1" goto menu
if not exist "%appdata%\Xhilaration\Users\%accn%" goto usernexist
echo.
echo  What is your password?
echo.
echo  1.) Return
echo.
set /p apassn=">"
if "%apassn%" == "1" goto menu
set /p apassf=<"%appdata%\Xhilaration\Users\%accn%\pass.dat"
if not "%apassf%" == "%apassn%" goto passin
echo.
echo  Account logged-in successfully!
echo.
pause >NUL
goto pmenu

:usernexist
cls
echo.
echo  Account %accn% does not exist!
echo.
pause >NUL
goto login

:passin
cls
echo.
echo  Password %apassn% is incorrect!
echo.
pause >NUL
goto login

:credits
cls
title Xhilaration - Credits
mode con cols=42lines=7
echo  É                                      »
echo.
colous 13 0 17,2 "Credits"
echo.
echo.
echo     Created by Blake Wyatt (Nabakin),
echo         With help from friends.
echo  È                                      ¼
pause >NUL
goto menu

:controls
cls
mode con cols=28lines=9
title Xhilaration - Controls
echo  É                        »
echo.
colous 12 0 11,2 "Controls"
echo.
echo.
echo    W = Up      S = Down
echo    A = Left    D = Right
echo.
echo         Q = Pause
echo  È                        ¼
pause >NUL
goto menu

:net
cls
titile Xhilaration - Setup
echo.
echo.
echo.
echo     There are some things you
echo    need to do before using this
echo    game. (Program allows you to
echo    create/join a Virtual LAN Network)
echo.
echo    1.) A link to a program you need
echo         to install has been copied
echo           to your clipboard paste, it
echo         in your web-browser and follow
echo        the instructions to download.
echo    2.) Open up the program it's called,
echo          "Hamachi"
echo    3.) If it asks you to accept anything
echo         accept it and accept the standard license.
echo    4.) Click the power button at the bottom
echo         left corrner of the window.
echo    5.) Click "Create" when it comes up.
echo    6.) When it asks you to set the "Master
echo         Password" say "No"
echo    7.) At the bottom left of the small window
echo         click the button that says looks like
echo          a triangle.
echo    5.) In the tab click "Join an existing network"
echo    6.) It should bring up a new window, for
echo         the "Network name" enter "Xhilaration"
echo    7.) For the "Network password" enter "guestpass" then click,
echo          "Join"
echo    8.) 











:pmenu
cd "%appdata%\Xhilaration"
cls
mode con cols=28lines=8
title Xhilaration - %accn%
echo  É                        »
echo.
colous 12 0 10,2 "Xhilaration"
echo.
echo.
echo    1.) Play "Xhilaration"
echo    2.) Log-out: %accn%
echo    3.) Options
echo  È                        ¼
choice /c 123 >NUL
if %errorlevel% == 1 goto game
if %errorlevel% == 2 (
set accn=
goto menu
)
if %errorlevel% == 3 goto moptions
goto pmenu

:moptions
cls
mode con cols=28lines=9
title Xhilaration - Options
echo  É                        »
echo.
colous 12 0 11,2 "Options"
echo.
echo.
echo    1.) Auto-Login
echo    2.) Delete: %accn%
echo.
echo     3.) Return
echo  È                        ¼
choice /c 123 >NUL
if %errorlevel% == 2 (
cd "%appdata%\Xhilaration\Users"
cls
echo.
rmdir /S "%accn%"
set accn=
goto menu
)
if %errorlevel% == 3 goto pmenu
goto moptions






:game
set y=5
set x=20
goto mode
:mode
mode con cols=50lines=15
goto loop
:loop
cls
title Xhilaration - Game - %accn%
colous 12 0 %x%,%y% "$2"
choice /c wsadq >NUL
set xl=%x%
set yl=%y%
if %errorlevel% == 1 set /a y=%y%-1
if %errorlevel% == 2 set /a y=%y%+1
if %errorlevel% == 3 set /a x=%x%-1
if %errorlevel% == 4 set /a x=%x%+1
if %errorlevel% == 5 goto pause
colous 15 0 %xl%,%yl% " "
goto loop

:pause
cls
title Xhilaration - Pause
mode con cols=24lines=8
echo  É                    »
echo.
colous 9 0 10,2 "PAUSED"
echo.
echo.
echo    1.) Exit
echo    2.) Menu
echo    3.) Resume
echo  È                    ¼
choice /c 123 >NUL
if %errorlevel% == 1 exit
if %errorlevel% == 2 goto pmenu
if %errorlevel% == 3 goto mode
goto pause