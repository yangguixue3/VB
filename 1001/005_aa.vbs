Dim str 
Dim objWScriptShell
Dim strResult
Dim objExec
str = chr(34)&"parameter from 005aa" &chr(34)

set objWScriptShell = WScript.CreateObject("WScript.Shell") 

set strResult = objWScriptShell.Run(".\005_bb.vbs"& " " & str ,0,true)

MsgBox "strResult"&strResult



MsgBox strResult

set objWScriptShell = Nothing

