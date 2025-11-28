@echo off

cd "%homepath%\Desktop"
if exist Calculator.lnk (
	exit
) else (
	mklink "C:\Users\%USERNAME%\EatMyShortz\a.exe" "%homepath%\Desktop\Calculator.exe"
)