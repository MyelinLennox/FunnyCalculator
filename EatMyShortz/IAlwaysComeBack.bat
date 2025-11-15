@echo off

cd "%homepath%\Desktop"
if exist Calculator.lnk (
	exit
) else (
	cp "C:\Users\%USERNAME%\EatMyShortz\Calculator.exe" "%homepath%\Desktop\Calculator.exe"
)