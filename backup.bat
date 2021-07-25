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
