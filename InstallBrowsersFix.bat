@echo off
echo Installing Firefox...
start /wait \\DC01\Installers\FirefoxSetup.exe /silent

echo Installing Chrome...
start /wait \\DC01\Installers\ChromeSetup.exe /silent /install

echo Installation complete.
exit
