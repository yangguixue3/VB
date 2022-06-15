' #Region 
'  do  loop
Sub ChkFirstWhile() 
    counter = 0 
    myNum = 20 
    Do While myNum > 10 
        myNum = myNum - 1 
        counter = counter + 1 
    Loop 
    MsgBox "The loop made " & counter & " repetitions." 
End Sub 
 
Sub ChkLastWhile() 
    counter = 0 
    myNum = 9 
    Do 
        myNum = myNum - 1 
        counter = counter + 1 
    Loop While myNum > 10 
    MsgBox "The loop made " & counter & " repetitions." 
End Sub

' ChkFirstWhile()
' ##########################End Region
' For Each...Next 
Sub ForEachTest()
    Dim TestArray(3) 
    Dim I 
    Dim index
    '  MsgBox Ubound(TestArray)
    '  MsgBox lbound(TestArray)
    For  index  = 0 To 3 
        TestArray(index) = + " NO :"  + Cstr(index) 
    Next 
    
    For Each I In TestArray 
    MsgBox I
    Next 
End Sub

ForEachTest()

