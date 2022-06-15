@echo off 
@REM 从数据库导出 数据

set dbServer = DESKTOP-E350C5T\SQLEXPRESS
set dbName = my_db
set username = sa
set password = 123456
set outPutFolder =C:\ziliao\002_vbs\VB\

echo input value is:%1

BCP %1 queryout "C:\Users\yang\Documents\GitHub\VB\1001\t.csv" -c -S DESKTOP-E350C5T\SQLEXPRESS -U sa -P 123456
@REM BCP "SELECT * FROM my_db.dbo.test;" queryout "C:\Users\yang\Documents\GitHub\VB\1001\t.csv" -c -S DESKTOP-E350C5T\SQLEXPRESS -U sa -P 123456
@REM User ID=sa;Password=123456;Initial Catalog=my_db;Data Source=DESKTOP-E350C5T\SQLEXPRESS;

pause 