@ECHO OFF

set createcharDB=YES
set createworldDB=YES
set createrealmDB=YES

set loadcharDB=YES
set loadworldDB=YES
set loadrealmDB=YES
set DBType=POPULATED
rem -- Change the values below to match your server --
set mysql=Tools\
set svr=localhost
set user=mangos
set pass=
set port=3306
set wdb=mangos2
set cdb=character2
set rdb=realmd

rem -- Don't change past this point --

:main
color 0e
CLS
echo   __  __      _  _  ___  ___  ___      
echo  ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                           
echo  ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo  ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ 
echo.                                        
echo  For help and support please visit:     
echo  Website: https://getmangos.eu         
echo     Wiki: https://getmangos.eu/wiki 
echo =======================================
echo == Database Creator and Loader v0.02 ==
echo =======================================

ECHO         Create Character Database : %createcharDB%
ECHO  Load SQL into Character Database : %loadcharDB%
ECHO.
ECHO             Create World Database : %createworldDB%
ECHO      Load SQL into World Database : %loadworldDB%
ECHO             World Database to load: %DBType%
ECHO.
ECHO             Create Realm Database : %createrealmDB%
ECHO      Load SQL into Realm Database : %loadrealmDB%
ECHO.


echo    V - Toggle Creating Character DB
echo    E - Toggle Creating World DB 
echo    D - Toggle World DB Type
echo    T - Toggle Creating Realm DB
echo.
echo    C - Toggle Loading Character DB
echo    W - Toggle Loading World DB 
echo    R - Toggle Loading Realm DB
echo.
echo    N - Next Step
echo    X - Exit
echo.
set /p activity= Please select an activity ? : 
if %activity% == V goto ToggleCharDB:
if %activity% == v goto ToggleCharDB:
if %activity% == E goto ToggleWorldDB:
if %activity% == e goto ToggleWorldDB:
if %activity% == D goto ToggleWorldDBType:
if %activity% == d goto ToggleWorldDBType:
if %activity% == T goto ToggleRealmDB:
if %activity% == t goto ToggleRealmDB:
if %activity% == C goto LoadCharDB:
if %activity% == c goto LoadCharDB:
if %activity% == W goto LoadWorldDB:
if %activity% == w goto LoadWorldDB:
if %activity% == R goto LoadRealmDB:
if %activity% == r goto LoadRealmDB:

if %activity% == N goto Step1:
if %activity% == n goto Step1:

if %activity% == X goto done:
if %activity% == x goto done:
goto main

:ToggleWorldDBType
if %DBType% == EMPTY goto ToggleWorldDBTypePopulated:
if %DBType% == POPULATED goto ToggleWorldDBTypeEmpty:
goto main:

:ToggleWorldDBTypePopulated
set DBType=POPULATED
goto main:

:ToggleWorldDBTypeEmpty
set DBType=EMPTY
goto main:

:ToggleCharDB
if %createcharDB% == NO goto ToggleCharDBNo:
if %createcharDB% == YES goto ToggleCharDBYes:
goto main:

:ToggleCharDBNo
set createcharDB=YES
goto main:

:ToggleCharDBYes
set createcharDB=NO
goto main:

:ToggleWorldDB
if %createworldDB% == NO goto ToggleWorldDBNo:
if %createworldDB% == YES goto ToggleWorldDBYes:
goto main:

:ToggleWorldDBNo
set createworldDB=YES
goto main:

:ToggleWorldDBYes
set createworldDB=NO
goto main:

:ToggleRealmDB
if %createrealmDB% == NO goto ToggleRealmDBNo:
if %createrealmDB% == YES goto ToggleRealmDBYes:
goto main:

:ToggleRealmDBNo
set createrealmDB=YES
goto main:

:ToggleRealmDBYes
set createrealmDB=NO
goto main:

:LoadCharDB
if %loadcharDB% == NO goto LoadCharDBNo:
if %loadcharDB% == YES goto LoadCharDBYes:
goto main:

:LoadCharDBNo
set loadcharDB=YES
goto main:

:LoadCharDBYes
set loadcharDB=NO
goto main:

:LoadWorldDB
if %loadworldDB% == NO goto LoadWorldDBNo:
if %loadworldDB% == YES goto LoadWorldDBYes:
goto main:

:LoadWorldDBNo
set loadworldDB=YES
goto main:

:LoadWorldDBYes
set loadworldDB=NO
goto main:

:LoadRealmDB
if %loadrealmDB% == NO goto LoadRealmDBNo:
if %loadrealmDB% == YES goto LoadRealmDBYes:
goto main:

:LoadRealmDBNo
set loadrealmDB=YES
goto main:

:LoadRealmDBYes
set loadrealmDB=NO
goto main:

:Step1
if not exist %mysql%\mysql.exe then goto patherror
color 08
CLS
echo   __  __      _  _  ___  ___  ___      
echo  ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                           
echo  ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo  ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ 
echo.                                        
echo ===========================================================
echo .
set /p svr=What is your MySQL host name?           [localhost] : 
if %svr%. == . set svr=localhost
set /p user=What is your MySQL user name?             [mangos] : 
if %user%. == . set user=mangos
set /p pass=What is your MySQL password?                   [ ] : 
if %pass%. == . set pass=
set /p port=What is your MySQL port?                    [3306] : 
if %port%. == . set port=3306
set /p cdb=What is your Character database name?  [character2] : 
if %cdb%. == . set cdb=character0
set /p wdb=What is your World database name?         [mangos2] : 
if %wdb%. == . set wdb=mangos0
set /p rdb=What is your Realm database name?          [realmd] : 
if %rdb%. == . set rdb=realmd

color 02

:WorldDB
REM ##### IF createworlddb = YES then create the DB
if %createworldDB% == YES goto WorldDB1:

:WorldDB2
REM ##### IF loadworlddb = YES then load the DB
if %loadworldDB% == YES goto WorldDB3:

:CharDB
REM ##### IF createchardb = YES then create the DB
if %createcharDB% == YES goto CharDB1:

:CharDB2
REM ##### IF loadchardb = YES then load the DB
if %loadcharDB% == YES goto CharDB3:

:RealmDB
REM ##### IF createrealmdb = YES then create the DB
if %createrealmDB% == YES goto RealmDB1:

:RealmDB2
REM ##### IF loadrealmdb = YES then load the DB
if %loadrealmDB% == YES goto RealmDB3:

goto done:

:WorldDB1
echo Creating World Database %wdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% -e "create database %wdb%";
goto WorldDB2:

:WorldDB3
if %DBType% == POPULATED goto WorldDB4:
echo  Loading world Database %wdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < World\Setup\mangosdLoadDB.sql
goto CharDB:

:WorldDB4
echo  Importing World database %wdb%
for %%i in (World\Setup\FullDB\*.sql) do echo %%i & %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i
goto CharDB:

:CharDB1
echo Creating Character Database %cdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% -e "create database %cdb%";
goto CharDB2:

:CharDB3
echo  Loading Character Database %cdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < Character\Setup\characterLoadDB.sql
goto RealmDB:

:RealmDB1
echo Creating Realm Database %rdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% -e "create database %rdb%";
goto RealmDB2:

:RealmDB3
echo  Loading Realm Database %rdb%
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %rdb% < Realm\Setup\realmdLoadDB.sql
goto done:



:patherror
echo Cannot find required files.
pause
goto :error


:error
echo  =======================================
echo  ==  Install Database Process Failed  ==
echo  =======================================

goto finish:

:done
color 08
echo   __  __      _  _  ___  ___  ___      
echo  ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                           
echo  ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo  ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ 
echo.                                        
echo  =======================================
echo  = Database Creation and Load complete =
echo  =======================================
echo.
echo Done :)
echo.
:finish
pause
pause