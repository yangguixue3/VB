 '================================================================================
'   WScript.Shell执行 exec cmd 找到IP地址
'================================================================================
'Option Explicit
'
'Dim objWshShell
'Set objWshShell = WScript.CreateObject ("WScript.Shell")
'
''声明一个变量来存放WshScriptExec对象
'Dim objExec
'' 在执行记事本的同时将WshScriptExec对象存放在变量中
'Set objExec = objWshShell.Exec( "ipconfig.exe")
'
'MsgBox objExec.StdOut.ReadAll ' 读取所有标准输出，显示
'
'
'
'set objExec = nothing
'set objWshShell = nothing


Option Explicit

Dim objWshShell
Set objWshShell = WScript.CreateObject("WScript.Shell")

Dim objExec, objStdOut, strLine, strIPAddress
strIPAddress = ""
Set objExec = objWshShell.Exec("ipconfig.exe") 'ipconfig.exeを起動
Set objStdOut = objExec.StdOut '標準出力を取得。
Do Until objStdOut.AtEndOfStream 'TextStreamの最後までループ
    strLine = objStdOut.ReadLine '1行読む
    If InStr(strLine,"IP Address") Then 'IP Addressが含まれる行なら（XP）
        '44文字目から後はIPアドレスなので取得
        strIPAddress = strIPAddress & Trim(Mid(strLine,44)) & vbCrLf
    ElseIf InStr(strLine,"IPv4") Then 'IPv4 アドレスなら（Vista）
        '35文字目から後はIPアドレスなので取得
        strIPAddress = strIPAddress & Trim(Mid(strLine,40)) & vbCrLf
    End If
Loop
objStdOut.Close 'TextStreamを閉じる

MsgBox strIPAddress 'IPアドレスを表示

Set objStdOut = Nothing
Set objExec = Nothing
Set objWshShell = Nothing