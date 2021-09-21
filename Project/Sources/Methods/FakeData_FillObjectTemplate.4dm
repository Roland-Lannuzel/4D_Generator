//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($1)  // Template
C_OBJECT:C1216($2)  //Object to be filled

C_OBJECT:C1216($template)
C_OBJECT:C1216($target)


C_BOOLEAN:C305($Gender; $ok; $fillAll)

C_PICTURE:C286($picture)

C_POINTER:C301($ArrayTitlePtr; $ArrayTitleAbrPtr; $ArrayFirstname)
C_POINTER:C301($ArrayPortrait0; $ArrayPortrait1; $ArrayPortrait2; $ArrayPortrait3)

C_LONGINT:C283($i; $t; $n)
C_LONGINT:C283($rnd1; $rnd2; $rnd3; $ID; $type)
C_LONGINT:C283($min; $max; $lgMax; $add; $build; $pos)
C_LONGINT:C283($zipID)

C_TEXT:C284($MinAsText; $MaxAsText)
C_TEXT:C284($DateMinText; $DateMaxText)
C_TEXT:C284($text)
C_TEXT:C284($Address)
C_TEXT:C284($email)
C_TEXT:C284($company)

C_TEXT:C284($firstname; $secondname; $lastname)
C_TEXT:C284($property; $feed)

C_DATE:C307($DateMin; $DateMax)
C_DATE:C307($date)

C_REAL:C285($Diviseur)
C_REAL:C285($fakeNum)

C_TIME:C306($HeureMin; $HeureMax)

ARRAY TEXT:C222($_properties; 0)

//title
//abreviatedTitle
//firstname
//lastname
//suffix (ex: Jr)
//gender (false = male; true = female)
//address
//zipCode
//city
//state
//country
//phone
//email

//company
//job
//department

//portrait0 : portrait young
//portrait1 : portrait adult
//portrait2 : portrait adult b&w
//portrait3 : portrait adult sepia

//textShort     1.000 to 10.000 char
//textMedium   10.000 to 25.000 char
//textLong     25.000 to 100.000 char

//longint1     from 0 to 1,000,000
//longint2     from -1,000,000 to 1,000,000
//real1        from 0.00 to 1,000,000.00
//real2        from -1,000,000.00 to 1,000,000.00

//date         from 1950/01/01 to 2049/12/31
//time         from 00:00:00 to 23:59:59
//duration     from 00:00:00 to 00:59:59
//boolean      boolean

ON ERR CALL:C155("FakeData_NoError")

If (Count parameters:C259=2)
	
	$template:=$1
	$target:=$2
	
	
	$gender:=Random:C100>Random:C100  // Woman if True
	If ($gender)
		//ladies first :-)
		$ArrayTitlePtr:=->_TitleF
		$ArrayTitleAbrPtr:=->_TitleFabr
		$ArrayFirstname:=->_FirstNameF
		
		$ArrayPortrait0:=->_portraitsF0
		$ArrayPortrait1:=->_portraitsF1
		$ArrayPortrait2:=->_portraitsF2
		$ArrayPortrait3:=->_portraitsF3
		
	Else 
		//men after
		$ArrayTitlePtr:=->_TitleM
		$ArrayTitleAbrPtr:=->_TitleMabr
		$ArrayFirstname:=->_FirstNameM
		
		$ArrayPortrait0:=->_portraitsM0
		$ArrayPortrait1:=->_portraitsM1
		$ArrayPortrait2:=->_portraitsM2
		$ArrayPortrait3:=->_portraitsM3
		
	End if 
	
	$zipID:=Random:C100%(Size of array:C274(_ZipCode))+1  // used for zipCode, city, state and country
	
	$firstname:=""  // used for email
	$lastname:=""  // used for email
	$company:=""  // used for email
	
	
	OB GET PROPERTY NAMES:C1232($template; $_properties)
	$n:=Size of array:C274($_properties)
	
	
	// put the "email" at the end if any… (based on firstname, lastname and company) 
	For ($i; 1; $n-1)
		
		$property:=$_properties{$i}
		$feed:=$template[$property]
		If ($feed="email")
			APPEND TO ARRAY:C911($_properties; $_properties{$i})
			DELETE FROM ARRAY:C228($_properties; $i; 1)
		End if 
		
	End for 
	
	
	For ($i; 1; $n)
		
		$property:=$_properties{$i}
		$feed:=$template[$property]
		Case of 
			: ($feed="title")
				$target[$property]:=$ArrayTitlePtr->{Random:C100%(Size of array:C274($ArrayTitlePtr->))+1}
				
			: ($feed="abreviatedTitle")
				$target[$property]:=$ArrayTitleAbrPtr->{Random:C100%(Size of array:C274($ArrayTitleAbrPtr->))+1}
				
			: ($feed="firstname")
				$firstname:=$ArrayFirstname->{Random:C100%(Size of array:C274($ArrayFirstname->))+1}
				$target[$property]:=$firstname
				
			: ($feed="lastname")
				$lastname:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
				$target[$property]:=$lastname
				
			: ($feed="suffix")
				$target[$property]:=_Suffix{Random:C100%(Size of array:C274(_Suffix))+1}
				
			: ($feed="gender")
				$target[$property]:=$gender
				
			: ($feed="company")
				$rnd1:=(Random:C100%Size of array:C274(_company1))+1
				$rnd2:=(Random:C100%Size of array:C274(_company2))+1
				$rnd3:=(Random:C100%Size of array:C274(_company3))+1
				$company:=_company1{$rnd1}+" "+_company2{$rnd2}+" "+_company3{$rnd3}
				$target[$property]:=$company
				
			: ($feed="job")
				$target[$property]:=_Job{Random:C100%(Size of array:C274(_Job))+1}
				
			: ($feed="department")
				$target[$property]:=_Department{Random:C100%(Size of array:C274(_Department))+1}
				
			: ($feed="address")
				$address:=_Format{11}
				$address:=Replace string:C233($address; "<number>"; String:C10((Random:C100%200)+1))
				$address:=Replace string:C233($address; "<type>"; _StreetType{(Random:C100%Size of array:C274(_StreetType))+1})
				$address:=Replace string:C233($address; "<name>"; _StreetName{(Random:C100%Size of array:C274(_StreetName))+1})
				$target[$property]:=$address
				
			: ($feed="zipCode")
				$target[$property]:=_ZipCode{$zipID}
				
			: ($feed="city")
				$target[$property]:=_City{$zipID}
				
			: ($feed="state")
				$target[$property]:=_State{$zipID}
				
			: ($feed="country")
				$target[$property]:=_Country{$zipID}
				
			: ($feed="phone")
				$target[$property]:=FakeData_BuildPhoneNumber(_Format{16})
				
			: ($feed="email")
				
				$email:=""
				If ($firstname#"")
					$email:=$email+$firstname
				End if 
				If ($secondname#"")
					If ($email#"")
						$email:=$email+"-"
					End if 
					$email:=$email+$secondname
				End if 
				If ($lastname#"")
					If ($email#"")
						$email:=$email+"."
					End if 
					$email:=$email+$lastname
				End if 
				If ($email="")
					$email:="john.doe"
				End if 
				If ($company#"")
					$company:=Replace string:C233(Lowercase:C14($company); "."; "")
				Else 
					$company:=Replace string:C233(Lowercase:C14(_company1{Random:C100%Size of array:C274(_company1)+1}); "."; "")
				End if 
				$email:=$email+"@"+$company+".com"
				$email:=Replace string:C233($email; " "; "-")
				$target[$property]:=$email
				
				//-------------------------------------------------------------------------------------------------------
				
			: ($feed="portrait0")
				READ PICTURE FILE:C678($ArrayPortrait0->{Random:C100%(Size of array:C274($ArrayPortrait0->))+1}; $picture)
				$target[$property]:=$picture
				
			: ($feed="portrait1")
				READ PICTURE FILE:C678($ArrayPortrait1->{Random:C100%(Size of array:C274($ArrayPortrait1->))+1}; $picture)
				$target[$property]:=$picture
				
			: ($feed="portrait2")
				READ PICTURE FILE:C678($ArrayPortrait2->{Random:C100%(Size of array:C274($ArrayPortrait2->))+1}; $picture)
				$target[$property]:=$picture
				
			: ($feed="portrait3")
				READ PICTURE FILE:C678($ArrayPortrait3->{Random:C100%(Size of array:C274($ArrayPortrait3->))+1}; $picture)
				$target[$property]:=$picture
				
				//-------------------------------------------------------------------------------------------------------
				
				
				
			: ($feed="text@")
				$ok:=True:C214
				Case of 
					: ($feed="textShort")
						$Id:=31
					: ($feed="textMedium")
						$Id:=32
					: ($feed="textLong")
						$Id:=33
					Else 
						$ok:=False:C215
				End case 
				
				If ($ok=True:C214)
					
					$text:=""
					
					$Min:=Num:C11(Substring:C12(_Format{$Id}; 1; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})-1))
					$Max:=Num:C11(Substring:C12(_Format{$Id}; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})+1))
					
					While (($Max-$Min)>32000)
						$Add:=Round:C94(($Max-$Min)/2; 0)
						If (Random:C100>Random:C100)
							//on augmente le min
							$Min:=$Min+$Add
						Else 
							//on diminue le max
							$Max:=$Max-$Add
						End if 
					End while 
					$Build:=$Min+(Random:C100%($Max-$Min))
					
					Repeat 
						$t:=1+(Random:C100%Size of array:C274(_FakeText))
						$text:=$text+_FakeText{$t}
						If (Random:C100>25000)
							$text:=$text+Char:C90(13)
						Else 
							$text:=$text+" "
						End if 
					Until (Length:C16($text)>=$Build)
					
					If (Length:C16($text)>$Max)
						$text:=Substring:C12($text; 1; $Max)
					End if 
					
					$target[$property]:=$text
				End if 
				
				
			: ($feed="longint@") | ($feed="real@")
				
				$ok:=True:C214
				Case of 
					: ($feed="longint1")
						$Id:=34
					: ($feed="longint2")
						$Id:=35
					: ($feed="real1")
						$Id:=36
					: ($feed="real2")
						$Id:=37
					Else 
						$ok:=False:C215
				End case 
				
				If ($ok=True:C214)
					
					$MinAsText:=Substring:C12(_Format{$Id}; 1; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})-1)
					$MaxAsText:=Substring:C12(_Format{$Id}; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})+1)
					$Pos:=Position:C15("."; $MaxAsText)
					If ($Pos>0)
						$Diviseur:=10^(Length:C16($MaxAsText)-$Pos)
					Else 
						$Diviseur:=1
					End if 
					$MinAsText:=Replace string:C233($MinAsText; "."; "")
					$MaxAsText:=Replace string:C233($MaxAsText; "."; "")
					
					$Min:=Num:C11($MinAsText)
					$Max:=Num:C11($MaxAsText)
					
					While (($Max-$Min)>32000)
						$Add:=Round:C94(($Max-$Min)/2; 0)
						If (Random:C100>Random:C100)
							//on augmente le min
							$Min:=$Min+$Add
						Else 
							//on diminue le max
							$Max:=$Max-$Add
						End if 
					End while 
					
					$fakeNum:=($Min+(Random:C100%($Max-$Min)))/$Diviseur
					
					$target[$property]:=$fakeNum
					
				End if 
				
			: ($feed="date")
				
				$Id:=38  //format de date YYYY/MM/DD
				$DateMinText:=Substring:C12(_Format{$Id}; 1; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})-1)
				$DateMaxText:=Substring:C12(_Format{$Id}; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})+1)
				
				$DateMin:=Add to date:C393(!00-00-00!; Num:C11(Substring:C12($DateMinText; 1; 4)); Num:C11(Substring:C12($DateMinText; 6; 2)); Num:C11(Substring:C12($DateMinText; 9; 2)))
				$DateMax:=Add to date:C393(!00-00-00!; Num:C11(Substring:C12($DateMaxText; 1; 4)); Num:C11(Substring:C12($DateMaxText; 6; 2)); Num:C11(Substring:C12($DateMaxText; 9; 2)))
				
				While (($DateMax-$DateMin)>32000)
					$Add:=Round:C94(($DateMax-$DateMin)/2; 0)
					If (Random:C100>Random:C100)
						//on augmente la date min
						$DateMin:=$DateMin+$Add
					Else 
						//on diminue le max
						$DateMax:=$DateMax-$Add
					End if 
				End while 
				
				$date:=$DateMin+(Random:C100%($DateMax-$DateMin))
				
				$target[$property]:=$date
				
			: ($feed="time") | ($feed="duration")
				
				If ($feed="time")
					$Id:=39  //time min and time max 00:00:00   23:59:59
				Else 
					$Id:=30  //time min and time max 00:00:00   00:59:59
				End if 
				
				//format de heure  HH/MN/SS
				$HeureMin:=Time:C179(Substring:C12(_Format{$Id}; 1; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})-1))
				$HeureMax:=Time:C179(Substring:C12(_Format{$Id}; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})+1))
				
				While (($HeureMax-$HeureMin)>32000)
					$Add:=Round:C94(($HeureMax-$HeureMin)/2; 0)
					If (Random:C100>Random:C100)
						//on augmente le min
						$HeureMin:=$HeureMin+$Add
					Else 
						//on diminue le max
						$HeureMax:=$HeureMax-$Add
					End if 
				End while 
				
				$target[$property]:=Time:C179(Time string:C180($HeureMin+(Random:C100%($HeureMax-$HeureMin))))
				
			: ($feed="boolean")
				$target[$property]:=Random:C100>Random:C100
				
		End case 
		
	End for 
	
	
Else 
	
	ALERT:C41("You must pass an object! Check your code.")
	
End if 

ON ERR CALL:C155("")

