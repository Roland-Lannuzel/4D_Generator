//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($1)  //object to be filled
C_OBJECT:C1216($object)

C_BOOLEAN:C305($Gender; $ok; $fillAll)

C_PICTURE:C286($picture)

C_POINTER:C301($ArrayTitlePtr; $ArrayTitleAbrPtr; $ArrayFirstname)
C_POINTER:C301($ArrayPortrait0; $ArrayPortrait1; $ArrayPortrait2; $ArrayPortrait3)

C_LONGINT:C283($i; $t)
C_LONGINT:C283($Rnd1; $Rnd2; $Rnd3; $ID; $type)
C_LONGINT:C283($Min; $Max; $lgMax; $Add; $Build; $Pos)
C_LONGINT:C283($zipID)

C_TEXT:C284($MinAsText; $MaxAsText)
C_TEXT:C284($DateMinText; $DateMaxText)
C_TEXT:C284($text)
C_TEXT:C284($property)
C_TEXT:C284($firstnameProperty; $secondnameProperty; $lastnameProperty; $lastname2Property; $companyName; $companynameProperty)

C_DATE:C307($DateMin; $DateMax)
C_DATE:C307($date)

C_REAL:C285($Diviseur)
C_REAL:C285($fakeNum)

C_TIME:C306($HeureMin; $HeureMax)

ARRAY TEXT:C222($_properties; 0)

//title
//abreviatedTitle
//firstname
//secondname
//lastname
//lastname2 (when two lastnames are needed - Spanish request)
//suffix (ex: Jr)
//maidenName
//gender (false = male; true = female)
//address
//zipCode
//city
//state
//country
//phone
//mobile
//fax
//email

//company
//job
//department

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
//boolean      Boolean

ON ERR CALL:C155("FakeData_NoError")

If (Count parameters:C259=1)
	
	$object:=$1
	
	OB GET PROPERTY NAMES:C1232($object; $_properties)
	If (Size of array:C274($_properties)=0)
		
		$object.title:=Null:C1517
		$object.abreviatedTitle:=Null:C1517
		$object.firstname:=Null:C1517
		$object.secondname:=Null:C1517
		$object.lastname:=Null:C1517
		$object.lastname2:=Null:C1517
		$object.suffix:=Null:C1517
		$object.maidenName:=Null:C1517
		$object.gender:=Null:C1517
		$object.company:=Null:C1517
		$object.department:=Null:C1517
		
		$object.address:=Null:C1517
		$object.zipcode:=Null:C1517
		$object.city:=Null:C1517
		$object.state:=Null:C1517
		$object.country:=Null:C1517
		
		$object.phone:=Null:C1517
		$object.mobile:=Null:C1517
		$object.fax:=Null:C1517
		$object.cell:=Null:C1517
		
		$object.email:=Null:C1517
		
		$object.textShort:=Null:C1517
		$object.textMedium:=Null:C1517
		$object.textLong:=Null:C1517
		
		$object.longint1:=Null:C1517
		$object.longint2:=Null:C1517
		$object.real1:=Null:C1517
		$object.real2:=Null:C1517
		
		
		$object.date:=Null:C1517
		$object.time:=Null:C1517
		$object.duration:=Null:C1517
		$object.bool:=Null:C1517
		
		
	End if 
	
	//-------------------------------------------------------------------------------------------------------
	
	$Gender:=Random:C100>Random:C100  //woman if true
	
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
	
	
	$zipID:=Random:C100%(Size of array:C274(_ZipCode))+1
	
	
	For each ($property; $object)
		
		Case of 
				
			: ($property="title")
				$object[$property]:=$ArrayTitlePtr->{Random:C100%(Size of array:C274($ArrayTitlePtr->))+1}
				
			: (($property="abreviatedtitle") | ($property="abreviated_title"))
				$object[$property]:=$ArrayTitleAbrPtr->{Random:C100%(Size of array:C274($ArrayTitleAbrPtr->))+1}
				
			: (($property="firstname") | ($property="first_name"))
				$firstnameProperty:=$property
				$object[$property]:=$ArrayFirstname->{Random:C100%(Size of array:C274($ArrayFirstname->))+1}
				
			: (($property="secondname") | ($property="second_name"))
				$secondnameProperty:=$property
				$object[$property]:=$ArrayFirstname->{Random:C100%(Size of array:C274($ArrayFirstname->))+1}
				
			: (($property="lastname") | ($property="last_name"))
				$lastnameProperty:=$property
				$object[$property]:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
				
			: (($property="lastname2") | ($property="last_name2") | ($property="last_name_2"))
				$lastname2Property:=$property
				$object[$property]:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
				
			: ($property="suffix")
				$object[$property]:=_Suffix{Random:C100%(Size of array:C274(_Suffix))+1}
				
			: (($property="maidenname") | ($property="maiden_name"))
				$object[$property]:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
				
			: ($property="gender")
				$object[$property]:=$Gender
				
				//-----------------------------------------------------------------------------------
				
			: ($property="company")
				$companynameProperty:=$property
				
				$Rnd1:=(Random:C100%Size of array:C274(_company1))+1
				$Rnd2:=(Random:C100%Size of array:C274(_company2))+1
				$Rnd3:=(Random:C100%Size of array:C274(_company3))+1
				$object[$property]:=_company1{$Rnd1}+" "+_company2{$Rnd2}+" "+_company3{$Rnd3}
				
				
			: ($property="job")
				$object[$property]:=_Job{Random:C100%(Size of array:C274(_Job))+1}
				
			: ($property="department")
				$object[$property]:=_Department{Random:C100%(Size of array:C274(_Department))+1}
				
			: ($property="address")
				$object[$property]:=_Format{11}
				$object[$property]:=Replace string:C233($object[$property]; "<number>"; String:C10((Random:C100%200)+1))
				$object[$property]:=Replace string:C233($object[$property]; "<type>"; _StreetType{(Random:C100%Size of array:C274(_StreetType))+1})
				$object[$property]:=Replace string:C233($object[$property]; "<name>"; _StreetName{(Random:C100%Size of array:C274(_StreetName))+1})
				
				
				//-----------------------------------------------------------------------------------
				
			: (($property="zipcode") | ($property="zip_code"))
				$object[$property]:=_ZipCode{$zipID}
				
			: ($property="city")
				$object[$property]:=_City{$zipID}
				
			: ($property="state")
				$object[$property]:=_State{$zipID}
				
			: ($property="country")
				$object[$property]:=_Country{$zipID}
				
				
				//-----------------------------------------------------------------------------------
				
			: (($property="phone") | ($property="mobile") | ($property="fax") | ($property="cell@"))
				$object[$property]:=FakeData_BuildPhoneNumber(_Format{16})
				
				
				//-----------------------------------------------------------------------------------
				
			: ($property="email")
				$object[$property]:=""
				
				
				$object[$property]:=""
				If ($object[$firstnameProperty]#Null:C1517)
					$object[$property]:=$object[$property]+Lowercase:C14($object[$firstnameProperty])
				End if 
				If ($object[$secondnameProperty]#Null:C1517)
					If ($object[$property]#"")
						$object[$property]:=$object[$property]+"-"
					End if 
					$object[$property]:=$object[$property]+Lowercase:C14($object[$secondnameProperty])
				End if 
				If ($object[$lastnameProperty]#Null:C1517)
					If ($object[$property]#"")
						$object[$property]:=$object[$property]+"."
					End if 
					$object[$property]:=$object[$property]+Lowercase:C14($object[$lastnameProperty])
				End if 
				
				If ($object[$property]="")
					$object[$property]:="john.doe"
				End if 
				
				If ($object[$companynameProperty]#Null:C1517)
					$companyName:=Replace string:C233(Lowercase:C14($object[$companynameProperty]); "."; "")
				Else 
					$companyName:=Replace string:C233(Lowercase:C14(_company1{Random:C100%Size of array:C274(_company1)+1}); "."; "")
				End if 
				
				$object[$property]:=$object[$property]+"@"+$companyName+".com"
				$object[$property]:=Replace string:C233($object[$property]; " "; "-")
				
				
			: ($property="portrait0")
				READ PICTURE FILE:C678($ArrayPortrait0->{Random:C100%(Size of array:C274($ArrayPortrait0->))+1}; $picture)
				$object[$property]:=$picture
				
			: ($property="portrait1")
				READ PICTURE FILE:C678($ArrayPortrait1->{Random:C100%(Size of array:C274($ArrayPortrait1->))+1}; $picture)
				$object[$property]:=$picture
				
			: ($property="portrait2")
				READ PICTURE FILE:C678($ArrayPortrait2->{Random:C100%(Size of array:C274($ArrayPortrait2->))+1}; $picture)
				$object[$property]:=$picture
				
			: ($property="portrait3")
				READ PICTURE FILE:C678($ArrayPortrait3->{Random:C100%(Size of array:C274($ArrayPortrait3->))+1}; $picture)
				$object[$property]:=$picture
				
			: ($property="text@")
				//-----------------------  3 random texts  ------------------------------------------------------------
				
				For ($i; 1; 3)
					$Id:=30+$i
					$text:=""
					
					$ok:=True:C214
					Case of 
						: (($i=1) & ($property="textShort"))
						: (($i=2) & ($property="textMedium"))
						: (($i=3) & ($property="textLong"))
						Else 
							$ok:=False:C215
					End case 
					
					If ($ok=True:C214)
						
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
						
						//textShort //1.000 to 10.000 char
						//textMedium   10.000 to 25.000 char
						//textLong   25.000 to 100.000 char
						
						$object[$property]:=$text
						
					End if 
					
				End for 
				
				
			: (($property="longint@") | ($property="real@"))
				//-----------------------  4 random numbers  ------------------------------------------------------------
				
				For ($i; 1; 4)
					$Id:=33+$i
					
					
					$ok:=True:C214
					Case of 
						: (($i=1) & ($property="longint1@"))
						: (($i=2) & ($property="longint2@"))
						: (($i=3) & ($property="real1@"))
						: (($i=4) & ($property="real2@"))
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
						
						//longint1     from 0 to 1,000,000
						//longint2     from -1,000,000 to 1,000,000
						//real1        from 0.00 to 1,000,000.00
						//real2        from -1,000,000.00 to 1,000,000.00
						
						$object[$property]:=$fakeNum
						
					End if 
				End for 
				
			: ($property="date@")
				
				
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
				
				$object[$property]:=$date
				
				
				//fill a random time
			: ($property="time@")
				
				$Id:=39  //time min and time max 00:00:00   23:59:59
				
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
				
				$object[$property]:=Time:C179(Time string:C180($HeureMin+(Random:C100%($HeureMax-$HeureMin))))
				
				
			: ($property="duration@")
				
				$Id:=30  //duration min and time max 00:00:00   00:59:59
				
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
				
				$object[$property]:=Time:C179(Time string:C180($HeureMin+(Random:C100%($HeureMax-$HeureMin))))
				
				//remplissage d'un booleen
			: ($property="bool@")
				
				$object[$property]:=(Random:C100>Random:C100)
				
		End case 
		
	End for each 
	
Else 
	
	ALERT:C41("You must pass an object! Check your code.")
	
End if 

ON ERR CALL:C155("")

