@echo off
SET prompt=Enter the number of your choice[Q to Quit]:

:SELECT
	echo Welcome to Dren's MC /bin Chooser!
	SET count=1
	for /f %%A IN ('dir bins /b') DO (
	  CALL :HANDLER %%A
	)
	set INPUT=
	set /P INPUT=%prompt%
	CALL set selection=%%file%input%%%
	if "%input%" == "Q" (
		GOTO :EOF
	)
	if "%selection%"=="" (
		cls
		SET prompt=Invalid number, try again[Q to Quit]:
		GOTO:SELECT
	)
	junction.exe -d ../bin
	junction.exe ../bin bins/%selection%
	Minecraft.exe
GOTO :EOF

:HANDLER
	echo %count%^) %~1
	SET file%count%=%~1
	SET /A count+=1
GOTO :EOF