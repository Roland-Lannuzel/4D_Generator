//%attributes = {}
C_LONGINT:C283($i)

//$Ptr{1} := pointer on TITLE
//$Ptr{2} := pointer on ABREVIATED TITLE
//$Ptr{3} := pointer on FIRSTNAME
//$Ptr{4} := pointer on SECONDNAME
//$Ptr{5} := pointer on LASTNAME
//$Ptr{6} := pointer on SUFFIX (ex: Jr)
//$Ptr{7} := pointer on MAIDEN NAME
//$Ptr{8} := pointeur on GENDER (`false = male; true = female) ->BOOLEAN
//$Ptr{9} := ---- unused yet ---
//$Ptr{10} := ---- unused yet ---

//$Ptr{11} := pointer on ADRESS
//$Ptr{12 } = pointer on ZIPCODE
//$Ptr{13} := pointer on CITY
//$Ptr{14} := pointer on STATE
//$Ptr{15} := pointer on COUNTRY
//$Ptr{16} := pointer on PHONE
//$Ptr{17} := pointer on MOBILE
//$Ptr{18} := pointer on FAX
//$Ptr{19} := pointer on email
//$Ptr{20} := ---- unused yet ---

//$Ptr{21} := pointer on COMPANY NAME
//$Ptr{22} := pointer on JOB TYPE
//$Ptr{23} := pointer on DEPARTMENT NAME
//$Ptr{24} := ---- unused yet ---
//$Ptr{25} := ---- unused yet ---
//$Ptr{26} := ---- unused yet ---
//$Ptr{27} := ---- unused yet ---
//$Ptr{28} := ---- unused yet ---
//$Ptr{29} := ---- unused yet ---
//$Ptr{30} := ---- unused yet ---

//$Ptr{31} := pointer on FAKE TEXT (ex: descriptions, etc.)
//$Ptr{32} := pointer on FAKE TEXT (ex: descriptions, etc.)
//$Ptr{33} := pointer on FAKE TEXT (ex: descriptions, etc.)
//$Ptr{34} := pointer on fake NUMERIC
//$Ptr{35} := pointer on fake NUMERIC
//$Ptr{36} := pointer on fake NUMERIC
//$Ptr{37} := pointer on fake NUMERIC
//$Ptr{38} := pointer on fake DATE
//$Ptr{39} := pointer on fake TIME
//$Ptr{40} := pointer on fake TIME

ON ERR CALL:C155("")

FakeData_ArraysInit



C_TEXT:C284($Val01)
C_TEXT:C284($Val02)
C_TEXT:C284($Val03)
C_TEXT:C284($Val04)
C_TEXT:C284($Val05)
C_TEXT:C284($Val06)
C_TEXT:C284($Val07)
C_BOOLEAN:C305($Val08)
C_TEXT:C284($Val09)
C_TEXT:C284($Val10)
C_TEXT:C284($Val11)
C_TEXT:C284($Val12)
C_TEXT:C284($Val13)
C_TEXT:C284($Val14)
C_TEXT:C284($Val15)
C_TEXT:C284($Val16)
C_TEXT:C284($Val17)
C_TEXT:C284($Val18)
C_TEXT:C284($Val19)
C_TEXT:C284($Val20)
C_TEXT:C284($Val21)
C_TEXT:C284($Val22)
C_TEXT:C284($Val23)
C_TEXT:C284($Val24)
C_TEXT:C284($Val25)
C_TEXT:C284($Val26)
C_TEXT:C284($Val27)
C_TEXT:C284($Val28)
C_TEXT:C284($Val29)
C_TEXT:C284($Val30)
C_TEXT:C284($Val31)
C_TEXT:C284($Val32)
C_TEXT:C284($Val33)
C_REAL:C285($Val34)
C_REAL:C285($Val35)
C_REAL:C285($Val36)
C_REAL:C285($Val37)
C_DATE:C307($Val38)
C_TIME:C306($Val39)
C_BOOLEAN:C305($Val40)

ARRAY POINTER:C280($_Ptr; 40)

$_Ptr{1}:=->$Val01
$_Ptr{2}:=->$Val02
$_Ptr{3}:=->$Val03
$_Ptr{4}:=->$Val04
$_Ptr{5}:=->$Val05
$_Ptr{6}:=->$Val06
$_Ptr{7}:=->$Val07
$_Ptr{8}:=->$Val08
$_Ptr{9}:=->$Val09
$_Ptr{10}:=->$Val10

$_Ptr{11}:=->$Val11
$_Ptr{12}:=->$Val12
$_Ptr{13}:=->$Val13
$_Ptr{14}:=->$Val14
$_Ptr{15}:=->$Val15
$_Ptr{16}:=->$Val16
$_Ptr{17}:=->$Val17
$_Ptr{18}:=->$Val18
$_Ptr{19}:=->$Val19
$_Ptr{20}:=->$Val20

$_Ptr{21}:=->$Val21
$_Ptr{22}:=->$Val22
$_Ptr{23}:=->$Val23
$_Ptr{24}:=->$Val24
$_Ptr{25}:=->$Val25
$_Ptr{26}:=->$Val26
$_Ptr{27}:=->$Val27
$_Ptr{28}:=->$Val28
$_Ptr{29}:=->$Val29

$_Ptr{30}:=->$Val30
$_Ptr{31}:=->$Val31
$_Ptr{32}:=->$Val32
$_Ptr{33}:=->$Val33
$_Ptr{34}:=->$Val34
$_Ptr{35}:=->$Val35
$_Ptr{36}:=->$Val36
$_Ptr{37}:=->$Val37
$_Ptr{38}:=->$Val38
$_Ptr{39}:=->$Val39
$_Ptr{40}:=->$Val40

FakeData_FillFields(->$_Ptr)

For ($i; 1; 40)
	Case of 
		: ($i=8) | ($i=40)  //boolean
			ALERT:C41(String:C10($i)+" : "+String:C10(Num:C11($_Ptr{$i}->)))
			
		: ($i=9)  //unused
		: ($i=10)  //unused
		: ($i=20)  //unused
		: ($i>=24) & ($i<=30)  //unused
			
		: ($i>=34)  //numeric, date or time
			ALERT:C41(String:C10($i)+" : "+String:C10($_Ptr{$i}->))
			
		Else 
			ALERT:C41(String:C10($i)+" : "+$_Ptr{$i}->)
	End case 
End for 


FakeData_ArraysDeinit

