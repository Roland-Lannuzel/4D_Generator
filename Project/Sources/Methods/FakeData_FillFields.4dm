//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_POINTER:C301($1)  //pointer on tableau de pointeurs

C_BOOLEAN:C305($Gender; $ok)

C_POINTER:C301($ArrayTitlePtr; $ArrayTitleAbrPtr; $ArrayFirstname)

C_LONGINT:C283($i; $t)
C_LONGINT:C283($Rnd1; $Rnd2; $Rnd3; $ID; $type)
C_LONGINT:C283($Min; $Max; $lgMax; $Add; $Build; $Pos)

C_TEXT:C284($MinAsText; $MaxAsText)
C_TEXT:C284($DateMinText; $DateMaxText)

C_DATE:C307($DateMin; $DateMax)

C_REAL:C285($Diviseur)

C_TIME:C306($HeureMin; $HeureMax)


//$Ptr{1} := pointer on TITLE
//$Ptr{2} := pointer on ABREVIATED TITLE
//$Ptr{3} := pointer on FIRSTNAME
//$Ptr{4} := pointer on SECONDNAME
//$Ptr{5} := pointer on LASTNAME
//$Ptr{6} := pointer on SUFFIX (ex: Jr)
//$Ptr{7} := pointer on MAIDEN NAME
//$Ptr{8} := pointeur on GENDER (`false = male; true = female) ->BOOLEAN
//$Ptr{9} := pointer on LASTNAME2 (when two lastnames are needed - Spanish request)
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

//$Ptr{31} := pointer on FAKE TEXT (ex: descriptions, etc.)  1.000 to 10.000 char
//$Ptr{32} := pointer on FAKE TEXT (ex: descriptions, etc.)   1.0000 to 25.000 char
//$Ptr{33} := pointer on FAKE TEXT (ex: descriptions, etc.)   25.000 to 100.000 char
//$Ptr{34} := pointer on fake NUMERIC   from 0 to 1,000,000
//$Ptr{35} := pointer on fake NUMERIC    from -1,000,000 to 1,000,000
//$Ptr{36} := pointer on fake NUMERIC    from 0.00 to 1,000,000.00
//$Ptr{37} := pointer on fake NUMERIC    from -1,000,000.00 to 1,000,000.00
//$Ptr{38} := pointer on fake DATE    from 1950/01/01 to 2049/12/31
//$Ptr{39} := pointer on fake TIME from 00:00:00 to 23:59:59
//$Ptr{40} := pointer on fake BOOLEAN

C_POINTER:C301($PtrTitle)
C_POINTER:C301($PtrTitleAbr)
C_POINTER:C301($PtrFirstName1)
C_POINTER:C301($PtrFirstName2)
C_POINTER:C301($PtrLastName)
C_POINTER:C301($PtrMaidenName)
C_POINTER:C301($PtrSuffix)
C_POINTER:C301($PtrGender)
C_POINTER:C301($PtrLastName2)

C_POINTER:C301($PtrAdress)
C_POINTER:C301($PtrZipCode)
C_POINTER:C301($PtrCity)
C_POINTER:C301($PtrState)
C_POINTER:C301($PtrCountry)
C_POINTER:C301($PtrPhone)
C_POINTER:C301($PtrMobile)
C_POINTER:C301($PtrFax)
C_POINTER:C301($PtrEmail)

C_POINTER:C301($PtrCompany)
C_POINTER:C301($PtrJob)
C_POINTER:C301($PtrDepartment)

C_POINTER:C301($PtrFakeText)
C_POINTER:C301($PtrFakeNum)
C_POINTER:C301($PtrFakeDate)
C_POINTER:C301($PtrFakeTime)
C_POINTER:C301($PtrFakeBool)

ON ERR CALL:C155("FakeData_NoError")

If (Count parameters:C259>=1)
	
	If (Size of array:C274($1->)=40)
		
		$PtrTitle:=$1->{1}
		$PtrTitleAbr:=$1->{2}
		$PtrFirstName1:=$1->{3}
		$PtrFirstName2:=$1->{4}
		$PtrLastName:=$1->{5}
		$PtrSuffix:=$1->{6}
		$PtrMaidenName:=$1->{7}
		$PtrGender:=$1->{8}
		$PtrLastName2:=$1->{9}
		
		$PtrAdress:=$1->{11}
		$PtrZipCode:=$1->{12}
		$PtrCity:=$1->{13}
		$PtrState:=$1->{14}
		$PtrCountry:=$1->{15}
		$PtrPhone:=$1->{16}
		$PtrMobile:=$1->{17}
		$PtrFax:=$1->{18}
		$PtrEmail:=$1->{19}
		
		$PtrCompany:=$1->{21}
		$PtrJob:=$1->{22}
		$PtrDepartment:=$1->{23}
		
		//$PtrFakeText1:=$1->{31}
		//$PtrFakeText2:=$1->{32}
		//$PtrFakeText3:=$1->{33}
		
		//$PtrFakeNum1:=$1->{34}
		//$PtrFakeNum2:=$1->{35}
		//$PtrFakeNum3:=$1->{36}
		//$PtrFakeNum4:=$1->{37}
		
		$PtrFakeDate:=$1->{38}
		$PtrFakeTime:=$1->{39}
		$PtrFakeBool:=$1->{40}
		
		//-------------------------------------------------------------------------------------------------------
		
		$Gender:=Random:C100>Random:C100  //woman if true
		
		If ($Gender)
			//ladies first :-)
			$ArrayTitlePtr:=->_TitleF
			$ArrayTitleAbrPtr:=->_TitleFabr
			$ArrayFirstname:=->_FirstNameF
		Else 
			//men after
			$ArrayTitlePtr:=->_TitleM
			$ArrayTitleAbrPtr:=->_TitleMabr
			$ArrayFirstname:=->_FirstNameM
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrTitle)))
			If ($PtrTitle->="")
				$PtrTitle->:=$ArrayTitlePtr->{Random:C100%(Size of array:C274($ArrayTitlePtr->))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrTitleAbr)))
			If ($PtrTitleAbr->="")
				$PtrTitleAbr->:=$ArrayTitleAbrPtr->{Random:C100%(Size of array:C274($ArrayTitleAbrPtr->))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrFirstName1)))
			If ($PtrFirstName1->="")
				$PtrFirstName1->:=$ArrayFirstname->{Random:C100%(Size of array:C274($ArrayFirstname->))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrFirstName2)))
			If ($PtrFirstName2->="")
				$PtrFirstName2->:=$ArrayFirstname->{Random:C100%(Size of array:C274($ArrayFirstname->))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrLastName)))
			If ($PtrLastName->="")
				$PtrLastName->:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrSuffix)))
			If ($PtrSuffix->="")
				$PtrSuffix->:=_Suffix{Random:C100%(Size of array:C274(_Suffix))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrMaidenName)))
			If ($PtrMaidenName->="") & ($Gender=True:C214)
				$PtrMaidenName->:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrGender)))
			$PtrGender->:=$Gender
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrLastName2)))
			If ($PtrLastName2->="")
				$PtrLastName2->:=_LastName{Random:C100%(Size of array:C274(_LastName))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrCompany)))  //ne pas déplacer, utile pour email
			If ($PtrCompany->="")
				$Rnd1:=(Random:C100%Size of array:C274(_company1))+1
				$Rnd2:=(Random:C100%Size of array:C274(_company2))+1
				$Rnd3:=(Random:C100%Size of array:C274(_company3))+1
				$PtrCompany->:=_company1{$Rnd1}+" "+_company2{$Rnd2}+" "+_company3{$Rnd3}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrJob)))
			If ($PtrJob->="")
				$PtrJob->:=_Job{Random:C100%(Size of array:C274(_Job))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrDepartment)))
			If ($PtrDepartment->="")
				$PtrDepartment->:=_Department{Random:C100%(Size of array:C274(_Department))+1}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrAdress)))
			If ($PtrAdress->="")
				$PtrAdress->:=_Format{11}
				$PtrAdress->:=Replace string:C233($PtrAdress->; "<number>"; String:C10((Random:C100%200)+1))
				$PtrAdress->:=Replace string:C233($PtrAdress->; "<type>"; _StreetType{(Random:C100%Size of array:C274(_StreetType))+1})
				$PtrAdress->:=Replace string:C233($PtrAdress->; "<name>"; _StreetName{(Random:C100%Size of array:C274(_StreetName))+1})
			End if 
		End if 
		
		$ID:=Random:C100%(Size of array:C274(_ZipCode))+1
		If (Not:C34(Is nil pointer:C315($PtrZipCode)))
			If ($PtrZipCode->="")
				$PtrZipCode->:=_ZipCode{$ID}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrCity)))
			If ($PtrCity->="")
				$PtrCity->:=_City{$ID}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrState)))
			If ($PtrState->="")
				$PtrState->:=_State{$ID}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrCountry)))
			If ($PtrCountry->="")
				$PtrCountry->:=_Country{$ID}
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrPhone)))
			If ($PtrPhone->="")
				$PtrPhone->:=FakeData_BuildPhoneNumber(_Format{16})
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrMobile)))
			If ($PtrMobile->="")
				$PtrMobile->:=FakeData_BuildPhoneNumber(_Format{17})
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrFax)))
			If ($PtrFax->="")
				$PtrFax->:=FakeData_BuildPhoneNumber(_Format{18})
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($PtrEmail)))
			If ($PtrEmail->="")
				If (Not:C34(Is nil pointer:C315($PtrFirstName1))) & (Not:C34(Is nil pointer:C315($PtrLastName)))
					If (Not:C34(Is nil pointer:C315($PtrCompany)))
						$PtrEmail->:=Lowercase:C14($PtrFirstName1->+"."+$PtrLastName->+"@"+$PtrCompany->+".com")
					Else 
						$Rnd1:=(Random:C100%Size of array:C274(_company1))+1
						$PtrEmail->:=Lowercase:C14($PtrFirstName1->+"."+$PtrLastName->+"@"+_company1{$Rnd1}+".com")
					End if 
					$PtrEmail->:=Replace string:C233($PtrEmail->; " "; "-")
				Else 
					$PtrEmail->:="john.doe@nowhere.com"
				End if 
			End if 
		End if 
		
		//remplissage de 3 textes aléatoires
		For ($i; 1; 3)
			$Id:=30+$i
			$PtrFakeText:=$1->{$Id}
			
			If (Not:C34(Is nil pointer:C315($PtrFakeText)))
				//vérifie que le pointeur pointe bien vers un texte
				$Type:=Type:C295($PtrFakeText->)
				$Ok:=True:C214  //dans les cas si dessous : 
				Case of 
					: ($Type=Is alpha field:K8:1)
					: ($Type=Is text:K8:3)
					: ($Type=Is string var:K8:2)
					Else 
						$Ok:=False:C215
				End case 
				
				If ($ok=True:C214)
					If ($PtrFakeText->="")
						
						$Min:=Num:C11(Substring:C12(_Format{$Id}; 1; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})-1))
						$Max:=Num:C11(Substring:C12(_Format{$Id}; Position:C15(Char:C90(Tab:K15:37); _Format{$Id})+1))
						
						If ($Type#Is text:K8:3)  //dans le cas des alphas on doit limiter le range
							$PtrFakeText->:="-"*255  //on l'alimente temporairement avec 255 "tirets"
							$LgMax:=Length:C16($PtrFakeText->)  //c_alpha(30;mavar) provoquera une troncature à 30 (en principe)
							If ($Min>$LgMax)
								$Min:=0
							End if 
							If ($Max>$LgMax)
								$Max:=$LgMax
							End if 
							$PtrFakeText->:=""  //on la vide nouveau
						End if 
						
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
							$PtrFakeText->:=$PtrFakeText->+_FakeText{$t}
							If (Random:C100>25000)
								$PtrFakeText->:=($PtrFakeText->)+Char:C90(13)
							Else 
								$PtrFakeText->:=($PtrFakeText->)+" "
							End if 
						Until (Length:C16($PtrFakeText->)>=$Build)
						
						If (Length:C16($PtrFakeText->)>$Max)
							$PtrFakeText->:=Substring:C12($PtrFakeText->; 1; $Max)
						End if 
						
					End if 
				Else 
					ALERT:C41("The pointer "+String:C10($Id)+" does not point on a text.")
				End if 
			End if 
			
		End for 
		
		//remplissage de 4 nombres aléatoires
		For ($i; 1; 4)
			$Id:=33+$i
			$PtrFakeNum:=$1->{$Id}
			
			If (Not:C34(Is nil pointer:C315($PtrFakeNum)))
				If ($PtrFakeNum->=0)
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
					
					$PtrFakeNum->:=($Min+(Random:C100%($Max-$Min)))/$Diviseur
					
				End if 
			End if 
			
		End for 
		
		
		//Remplissage d'une date aléatoire
		If (Not:C34(Is nil pointer:C315($PtrFakeDate)))
			$Id:=38
			If ($PtrFakeDate->=!00-00-00!)
				//format de date YYYY/MM/DD
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
				
				$PtrFakeDate->:=$DateMin+(Random:C100%($DateMax-$DateMin))
				
			End if 
		End if 
		
		//Remplissage d'une durée aléatoire
		If (Not:C34(Is nil pointer:C315($PtrFakeTime)))
			$Id:=39
			If ($PtrFakeTime->=?00:00:00?)
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
				
				$PtrFakeTime->:=Time:C179(Time string:C180($HeureMin+(Random:C100%($HeureMax-$HeureMin))))
				
			End if 
		End if 
		
		//remplissage d'un booleen
		If (Not:C34(Is nil pointer:C315($PtrFakeBool)))
			$PtrFakeBool->:=(Random:C100>Random:C100)
		End if 
		
	Else 
		
		ALERT:C41("The size of the ptr array must be 40. The ranges have changed. Check your code.")
		
	End if 
	
Else 
	
	ALERT:C41("You must pass a pointer on an array of pointers. Check your code.")
	
End if 

ON ERR CALL:C155("")
