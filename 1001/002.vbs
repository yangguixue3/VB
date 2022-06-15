' 时间
dim times
Sub clock()
    times = Year(Now())
    times = times & "/" & Right("0"& Month(Now()),2)
    times = times & "/" & Right("0"& Day(Now()),2)
    times = times & " " & Right("0"& Hour(Now()),2)
    times = times & ":" & Right("0"& Minute(Now()),2)
    times = times & ":" & Right("0"& Minute(Now()),2)
    times = times & ":" & Right("0"& Second(Now()),2)
End Sub
clock()

Dim Url
' Url = "C:\Users\yang\Desktop\log.log"
Url = ".\log.log"
Dim fs
Dim fw
Dim data

' ------------------------
'  write
' ------------------------
Sub write(str)
    set fs = Wscript.CreateObject("Scripting.FileSystemObject")
    set fw = fs.OpenTextFile(Url,8,true)
    fw.WriteLine times & " "& getcomputerName() & " " & getProcessName
    fw.WriteLine str
    fw.Close
End Sub
' ------------------------
'  read
' ------------------------
Sub read()
    With Wscript.CreateObject("Scripting.FileSystemObject")
        if  (.FileExists(Url)= False) Then

        Else
        Set fs = .OpenTextFile(Url,1,true)
        data = fs.ReadAll
            fs.Close
        End if
    End With

    if  IsEmpty(data) Then
        MsgBox " data なし"
    End if
End Sub
' read()


Function  getcomputerName() 
    ' コンピュータ名
    With CreateObject("Wscript.Network")
        if Err.Number <> 0 Then
        MsgBox " error NO:" & Err.Number
        end if
        getcomputerName = .computerName
    End With
    
    
End Function

Function  getProcessName() 
    ' プログラムID
    getProcessName = SPLIT(Wscript.ScriptName,".")(0)
    
End Function

' ------------------------
'  DB コネクション　接続処理
' ------------------------
Sub openDbConn()
    Dim str
    Dim constr
        constr = "Provider=SQLOLEDB;User ID=sa;Password=123456;Initial Catalog=my_db;Data Source=DESKTOP-E350C5T\SQLEXPRESS;"
    Dim strSQL
        strSQL = "SELECT * FROM dbo.test;"
    dim objCon  
    set objCon  = CreateObject("ADODB.Connection")
    ' 接続
    ' Dim UDL_file =".\mex.udl"
    ' objCon.ConnectionString = "FILE NAME=" & UDL_file
    objCon.ConnectionString = constr
    objCon.Open

    Dim recordset
     Set recordset = objCon.Execute(strSQL)
    '  recordset.Movenext  id	name	age	sex	bathday
     dim userid,username,userage,usersex,userbathday
     Do Until recordset.EOF
        userid=recordset.Fields("id")
        username=recordset.Fields("name")
        userage=recordset.Fields("age")
        usersex=recordset.Fields("sex")
        userbathday=recordset.Fields("bathday")
        str = str & userid&","&username&","&userage&","&usersex&","&userbathday & chr(13)+chr(10)
        ' MsgBox userid&","&username&","&userage&","&usersex&","&userbathday
         recordset.Movenext
     loop
' write(str)
Sample_ADOStream_write(str)
End Sub

openDbConn()
' -------------------------
' テキストファイルの書き込み
' -------------------------


Sub Sample_ADOStream_write(str)

Dim sr      
Set sr = CreateObject("ADODB.Stream")
sr.Mode = 3 '読み取り/書き込みモード
sr.Type = 2 'テキストデータ
sr.Charset = "UTF-8" '文字コードを指定
sr.Open 'Streamオブジェクトを開く
sr.WriteText str, 0 '0:adWriteChar
sr.SaveToFile Url, 2 '1:adSaveCreateNotExist 2:adSaveCreateOverWrite
sr.Close 'Streamを閉じる
Set sr = Nothing 'オブジェクトの解放
 
End Sub

' -------------------------
' テキストファイルの読み込み
' -------------------------

Sample_ADOStream_read()
Sub Sample_ADOStream_read()
Dim sr      
Dim str 

Set sr = CreateObject("ADODB.Stream")

sr.Mode = 3 '読み取り/書き込みモード

sr.Type = 2 'テキストデータ

sr.Charset = "UTF-8" '文字コードを指定

sr.Open 'Streamオブジェクトを開く

sr.LoadFromFile (Url) 'ファイルの内容を読み込む

sr.Position = 0 'ポインタを先頭へ

str = sr.ReadText() 'データ読み込み
MsgBox str
sr.Close 'Streamを閉じる

Set sr = Nothing 'オブジェクトの解放
 
End Sub


' ----------------------
'  Scripting.Dictionary
' ----------------------
Dim dictionaryList
MyDictionary()
' MsgBox dictionaryList.Count
' MsgBox dictionaryList.Item("apple")
Sub MyDictionary()
set dictionaryList = CreateObject("scripting.Dictionary")
    dictionaryList.Add "orange", 100
    dictionaryList.Add "apple", 200
    dictionaryList.Add "melon", 300


End Sub


