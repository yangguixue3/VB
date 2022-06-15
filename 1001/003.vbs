Dim strCmd
Dim dbServer
Dim dbName
Dim username
Dim password
Dim outPutFolder
Dim strSQL

Dim strResult
Dim objWScriptShell

 dbServer = "DESKTOP-E350C5T\SQLEXPRESS"
 dbName = "my_db"
 username = "sa"
 password = "123456"
 outPutFolder ="C:\Users\yang\Documents\GitHub\VB\1001\t.csv"
strSQL = "SELECT * FROM my_db.dbo.test;"
' strCmd = "BCP " & Chr(34) & strSQL & Chr(34) &_
'         " queryout " & Chr(34) & outPutFolder & Chr(34) & _
'         " -t , " &_          
'         " -r 0x0A" &_        
'         " -c" &_             
'         " -S " & Chr(34)& dbServer & Chr(34) &_
'         " -D " & Chr(34)& dbName & Chr(34) &_
'         " -U " & Chr(34)& username & Chr(34) &_
'         " -P " & Chr(34)& password & Chr(34)



' set objWScriptShell = WScript.CreateObject("WScript.Shell") 
' '  strResult = objWScriptShell.Run("cmd.exe /k bcp ""SELECT * FROM my_db.dbo.test;"" queryout ""C:\ziliao\002_vbs\VB\test.csv"" -c -S ""DESKTOP-E350C5T\SQLEXPRESS"" -U ""sa"" -P ""123456""",0,true)



' strResult = objWScriptShell.Run("cmd.exe /k "& strCmd,1,True)
' MsgBox strResult


set objWScriptShell = WScript.CreateObject("WScript.Shell") 

' set strResult = objWScriptShell.Run("C:\Users\yang\Documents\GitHub\VB\1001\003BCPRead.bat"& " dd" ,1,true)

set strResult = objWScriptShell.Run("C:\Users\yang\Documents\GitHub\VB\1001\003BCPRead.bat "& Chr(34) &strSQL& Chr(34) ,1,true)

MsgBox strResult
