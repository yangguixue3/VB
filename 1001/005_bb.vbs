  '--------------------
    ' パラメータ取得
    '--------------------
    Dim objArg
    Set objArg = WScript.Arguments

     'IFID
     ' objArg.Count 
    strParameter = objArg(0)
    ' MsgBox strParameter
    WScript.Echo strParameter
    WScript.Quit 9