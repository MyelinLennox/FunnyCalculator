@echo off

cd "%homepath%\Desktop"
if exist Calculator.lnk (
	exit
) else (
	mklink "C:\Program Files\EatMyShortz\a.exe" "%homepath%\Desktop\Calculator.exe"
)