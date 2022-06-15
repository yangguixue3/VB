' Dim strCmd
' Dim dbServer
' Dim dbName
' Dim username
' Dim password
' Dim outPutFolder
' Dim strSQL

' Dim strResult
' Dim objWScriptShell

'  dbServer = "DESKTOP-E350C5T\SQLEXPRESS"
'  dbName = "my_db"
'  username = "sa"
'  password = "123456"
'  outPutFolder ="C:\Users\yang\Documents\GitHub\VB\1001\t.csv"
' strSQL = "SELECT * FROM my_db.dbo.test;"
' strCmd = "bcp " & Chr(34) & strSQL & Chr(34) &_
'         " queryout " & outPutFolder &_
'         " -t , " &_          
'         " -r 0x0A" &_        
'         " -c" &_             
'         " -S " & dbServer &_
'         " -D " & dbName &_
'         " -U " & username &_
'         " -P " & password 


' set objWScriptShell = WScript.CreateObject("WScript.Shell") 
'  strResult = objWScriptShell.Run(strCmd,3,true)

Dim objWScriptShell
Dim strResult
set objWScriptShell = WScript.CreateObject("WScript.Shell") 

set strResult = objWScriptShell.Run("./003BCPRead.bat",0,true)

MsgBox strResult
