' =========
' 圧縮処理
' =========
Dim fso
' Set fso = CreateObject("Scripting.FileSystemObject")
'  If fso.FileExists("C:\Users\yang\Documents\GitHub\VB\1001\1001.7z") then
'          fso.DeleteFile("C:\Users\yang\Documents\GitHub\VB\1001\7z")
'  End If
' 圧縮コマンド作成
Dim strCMD
strCMD = Chr(34)& "C:\Program Files\7-Zip\7z.exe"  &Chr(34) & _
" a" & _
" " & "C:\Users\yang\Documents\GitHub\VB\1001" & _
" " & "C:\Users\yang\Documents\GitHub\VB\1001\log.log"
'圧縮実行
With WScript.CreateObject("WScript.Shell")
set objExec = .Exec(strCMD)
' If Err.Number <> 0 then MsgBox Err.Number
' 'Call WriteLog (, , )
' Else
MsgBox objExec.Status 
' End if
End With