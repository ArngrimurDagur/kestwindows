@echo off
start /wait \\DC01\Installers\FirefoxSetup.exe /silent
start /wait \\DC01\Installers\ChromeStandaloneSetup64.exe /silent /install
exit
