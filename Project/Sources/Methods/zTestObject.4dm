//%attributes = {}
C_LONGINT:C283($i)
C_OBJECT:C1216($obj)

ON ERR CALL:C155("")

FakeData_ArraysInit("fr")


$obj:=New object:C1471("title"; Null:C1517; "abreviatedTitle"; Null:C1517; "firstname"; Null:C1517; "secondname"; Null:C1517; "lastname"; Null:C1517; "company"; Null:C1517; "email"; Null:C1517; "job"; Null:C1517; "department"; Null:C1517)
FakeData_FillObject($obj)

$obj:=New object:C1471("title"; Null:C1517; "abreviatedtitle"; Null:C1517; "first_name"; Null:C1517; "Second_name"; Null:C1517; "last_Name"; Null:C1517; "Company"; Null:C1517; "Email"; Null:C1517; "job"; Null:C1517; "department"; Null:C1517)
FakeData_FillObject($obj)

$obj:=New object:C1471
FakeData_FillObject($obj)

$obj:=New object:C1471("real1_a"; Null:C1517; "real1_b"; Null:C1517; "real1_c"; Null:C1517; "real1_d"; Null:C1517; "real2_a"; Null:C1517; "real2_b"; Null:C1517; "real2_c"; Null:C1517; "real2_d"; Null:C1517)
FakeData_FillObject($obj)

$obj:=New object:C1471("date1"; Null:C1517; "date2"; Null:C1517; "date3"; Null:C1517; "date4"; Null:C1517; "time1"; Null:C1517; "time2"; Null:C1517; "time3"; Null:C1517; "duration1"; Null:C1517; "duration2"; Null:C1517; "duration3"; Null:C1517; "duration4"; Null:C1517)
FakeData_FillObject($obj)

$obj:=New object:C1471
FakeData_FillObject($obj)

ALERT:C41(JSON Stringify:C1217($obj; *))

//title
//abreviatedTitle
//firstname
//secondname

FakeData_ArraysDeinit

