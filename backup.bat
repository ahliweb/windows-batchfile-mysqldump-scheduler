@echo off
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
 
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
 
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
 
set year=%date:~-4%
 
set month=%date:~3,2%
if "%month:~0,2%" == " " set month=0%month:~1,1%
 
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
 
set datetimef=%year%_%month%_%day%_%hour%%min%%secs%
 
title autobackup mysql by ronald modified by unggul@ahliweb.com & Zufar

set timestamp=date_time
:: please change this backup directory bellow :
set backupDir=D:\BackupIbra\ibra
:: please change this directory of your mysqldump.exe, user, password, and database bellow :
"d:\xampp\mysql\bin\mysqldump.exe" -u"youruser" -p"yourmysqluserpassword" yourdatabase > %backupDir%%datetimef%.sql

:: if you use google drive or other online backup please refer to these bellow :
:: - create 3 folder on your backup drive : example: d:\backup ;  d:\backupLama ; d:\backupScript ; 
::   place your script in d:\backupScript and put this script backup.bat here, then call this script backup.bat from your windows 10 scheduler
:: - don't forget 

:: auto move script start bellow
:: X is how long your files will be kept on Google drive 
set X=3
set "source=D:\Backup"
set "destination=D:\BackupLama"

robocopy "%source%" "%destination%" /mov /minage:%X%

:: auto move script to drive c: start bellow :
:: Y is how long your files will be kept from drive D
set Y=365
set "csource=D:\BackupLama"
set "cdestination=C:\Temp"

robocopy "%csource%" "%cdestination%" /mov /minage:%Y%

exit /b
