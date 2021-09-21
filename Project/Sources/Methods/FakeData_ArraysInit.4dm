//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}

C_TEXT:C284($1)  // localisation (EN / FR / etc) 
C_POINTER:C301($2)  //pointeur OPTIONNEL sur un tableau de format dont les valeurs (si elles sont alimentées) remplaceront celles de "◊_Format"

C_BOOLEAN:C305($SaveBlob)
C_TEXT:C284($Format1; $Format2)
C_TEXT:C284($ResourcesFolder)
C_TEXT:C284($Paquet)
C_TEXT:C284($MainResourcesFolder)
C_TEXT:C284($LangFolder)
C_TEXT:C284($DocPath; $BlobPath)
C_LONGINT:C283($i; $j; $n; $Loop; $Offset; $ok)
C_TIME:C306($DocRef)

C_TEXT:C284($localisation)
C_POINTER:C301($PtrArray)

If (Count parameters:C259>=1)
	$localisation:=$1
Else 
	$localisation:="en"
End if 

If (Count parameters:C259>=2)
	$PtrArray:=$2
End if 



//$ResourcesFolder:=Structure file  //structure du composant

//$n:=Length($ResourcesFolder)
//Repeat 
//$n:=$n-1
//Until ($ResourcesFolder[[$n]]=$FolderSep) | ($n=0)
//$MainResourcesFolder:=Substring($ResourcesFolder;1;$n)
//$MainResourcesFolder:=$MainResourcesFolder+"Resources"+$FolderSep

$MainResourcesFolder:=Get 4D folder:C485(Current resources folder:K5:16)

If (Test path name:C476($MainResourcesFolder)=Is a folder:K24:2)
	
	//on va faire une premiere recherche dans le dossier localisé
	//si on ne trouve pas, une deuxième passe sera effectuée dans le
	//la boucle ci-dessous ne va donc peut-etre ne s'effectuer qu'une seule fois :-)
	
	For ($Loop; 1; 2)
		
		If ($Loop=1)
			//1ere boucle, on cherche dans le dossier ressources localisé
			$LangFolder:=$localisation+".lproj"+Folder separator:K24:12
			If (Test path name:C476($MainResourcesFolder+$LangFolder)=Is a folder:K24:2)
				//le dossier localisé existe :)
				//(mais il ne contiendra pas forcément un blob de génération de data)
				$ResourcesFolder:=$MainResourcesFolder+$LangFolder
			Else 
				//il n'a PAS de dossier localisé pour cette langue
				//on passe direct à la deuxième boucle
				$Loop:=2
				$ResourcesFolder:=$MainResourcesFolder
			End if 
		Else 
			//2ème boucle on cherche dans le dossier ressources global
			$ResourcesFolder:=$MainResourcesFolder
		End if 
		
		$BlobPath:=$ResourcesFolder+"FakeData.blob"
		If ((Test path name:C476($BlobPath)=Is a document:K24:1) & (Not:C34(Shift down:C543)))
			
			//le blob existe
			
			ARRAY TEXT:C222(_StreetType; 0)
			ARRAY TEXT:C222(_StreetName; 0)
			ARRAY TEXT:C222(_company1; 0)
			ARRAY TEXT:C222(_company2; 0)
			ARRAY TEXT:C222(_company3; 0)
			ARRAY TEXT:C222(_ZipCode; 0)
			ARRAY TEXT:C222(_City; 0)
			ARRAY TEXT:C222(_State; 0)
			ARRAY TEXT:C222(_Country; 0)
			ARRAY TEXT:C222(_TitleM; 0)
			ARRAY TEXT:C222(_TitleMabr; 0)
			ARRAY TEXT:C222(_TitleF; 0)
			ARRAY TEXT:C222(_TitleFabr; 0)
			ARRAY TEXT:C222(_FirstNameM; 0)
			ARRAY TEXT:C222(_FirstNameF; 0)
			ARRAY TEXT:C222(_LastName; 0)
			ARRAY TEXT:C222(_Suffix; 0)
			ARRAY TEXT:C222(_Format; 0)
			ARRAY TEXT:C222(_Job; 0)
			ARRAY TEXT:C222(_Department; 0)
			ARRAY TEXT:C222(_FakeText; 0)
			
			
			
			C_BLOB:C604($Blob)
			DOCUMENT TO BLOB:C525($BlobPath; $Blob)
			//EXPAND BLOB($Blob)
			
			$Offset:=0
			BLOB TO VARIABLE:C533($Blob; _StreetType; $Offset)
			BLOB TO VARIABLE:C533($Blob; _StreetName; $Offset)
			BLOB TO VARIABLE:C533($Blob; _company1; $Offset)
			BLOB TO VARIABLE:C533($Blob; _company2; $Offset)
			BLOB TO VARIABLE:C533($Blob; _company3; $Offset)
			BLOB TO VARIABLE:C533($Blob; _ZipCode; $Offset)
			BLOB TO VARIABLE:C533($Blob; _City; $Offset)
			BLOB TO VARIABLE:C533($Blob; _State; $Offset)
			BLOB TO VARIABLE:C533($Blob; _Country; $Offset)
			BLOB TO VARIABLE:C533($Blob; _TitleM; $Offset)
			BLOB TO VARIABLE:C533($Blob; _TitleMabr; $Offset)
			BLOB TO VARIABLE:C533($Blob; _TitleF; $Offset)
			BLOB TO VARIABLE:C533($Blob; _TitleFabr; $Offset)
			BLOB TO VARIABLE:C533($Blob; _FirstNameM; $Offset)
			BLOB TO VARIABLE:C533($Blob; _FirstNameF; $Offset)
			BLOB TO VARIABLE:C533($Blob; _LastName; $Offset)
			BLOB TO VARIABLE:C533($Blob; _Suffix; $Offset)
			BLOB TO VARIABLE:C533($Blob; _Job; $Offset)
			BLOB TO VARIABLE:C533($Blob; _Department; $Offset)
			BLOB TO VARIABLE:C533($Blob; _FakeText; $Offset)
			
			BLOB TO VARIABLE:C533($Blob; _Format; $Offset)
			
			//BLOB TO VARIABLE($Blob; _portraitsF0; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsF1; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsF2; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsF3; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsM0; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsM1; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsM2; $Offset)
			//BLOB TO VARIABLE($Blob; _portraitsM3; $Offset)
			
			
			// <debug code>
			ARRAY POINTER:C280($_PtrArray; 0)
			APPEND TO ARRAY:C911($_PtrArray; ->_StreetType)
			APPEND TO ARRAY:C911($_PtrArray; ->_StreetName)
			APPEND TO ARRAY:C911($_PtrArray; ->_company1)
			APPEND TO ARRAY:C911($_PtrArray; ->_company2)
			APPEND TO ARRAY:C911($_PtrArray; ->_company3)
			APPEND TO ARRAY:C911($_PtrArray; ->_ZipCode)
			APPEND TO ARRAY:C911($_PtrArray; ->_City)
			APPEND TO ARRAY:C911($_PtrArray; ->_State)
			APPEND TO ARRAY:C911($_PtrArray; ->_Country)
			APPEND TO ARRAY:C911($_PtrArray; ->_TitleM)
			APPEND TO ARRAY:C911($_PtrArray; ->_TitleMabr)
			APPEND TO ARRAY:C911($_PtrArray; ->_TitleF)
			APPEND TO ARRAY:C911($_PtrArray; ->_TitleFabr)
			APPEND TO ARRAY:C911($_PtrArray; ->_FirstNameM)
			APPEND TO ARRAY:C911($_PtrArray; ->_FirstNameF)
			APPEND TO ARRAY:C911($_PtrArray; ->_LastName)
			APPEND TO ARRAY:C911($_PtrArray; ->_Suffix)
			APPEND TO ARRAY:C911($_PtrArray; ->_Job)
			APPEND TO ARRAY:C911($_PtrArray; ->_Department)
			APPEND TO ARRAY:C911($_PtrArray; ->_FakeText)
			
			$n:=Size of array:C274($_PtrArray)
			
			For ($i; 1; $n)
				If (Size of array:C274($_PtrArray{$i}->)=0)
					ALERT:C41("le tableau "+String:C10($i)+" est vide")
				End if 
			End for 
			// </debug code>
			
			
			$Loop:=2  //exit loop
			
		Else 
			
			//le Blob n'existe pas, on cherche à le créer (si les fichiers textes sont présents)
			
			$SaveBlob:=True:C214  //optimiste
			
			
			//---------------------------------------
			//                  Fichiers MONO COLONNES
			//---------------------------------------
			
			ARRAY TEXT:C222($_DocNames; 0)
			ARRAY POINTER:C280($_ArrayPtr; 0)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeStreetTypes.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_StreetType)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeStreetNames.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_StreetName)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeLastNames.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_LastName)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeSuffixes.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_Suffix)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeJobs.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_Job)
			
			APPEND TO ARRAY:C911($_DocNames; "FakeDepartments.txt")
			APPEND TO ARRAY:C911($_ArrayPtr; ->_Department)
			
			
			$n:=6
			
			For ($i; 1; $n)
				If ($SaveBlob=True:C214)
					ARRAY TEXT:C222($_ArrayPtr{$i}->; 0)
					
					$DocPath:=$ResourcesFolder+$_DocNames{$i}
					If (Test path name:C476($DocPath)=Is a document:K24:1)
						$DocRef:=Open document:C264($DocPath)
						Repeat 
							RECEIVE PACKET:C104($DocRef; $Paquet; Char:C90(13))
							If ($Paquet#"")
								//traitement du LF éventuel
								If ($Paquet[[1]]=Char:C90(10))
									$Paquet:=Substring:C12($Paquet; 2)
								End if 
								If ($Paquet#"")
									APPEND TO ARRAY:C911($_ArrayPtr{$i}->; $Paquet)
								End if 
							End if 
						Until (ok=0) | ($Paquet="")
						CLOSE DOCUMENT:C267($DocRef)
					Else 
						$SaveBlob:=False:C215
						ALERT:C41("Missing file : "+$_DocNames{$i})
					End if 
				End if 
				
			End for 
			
			
			//---------------------------------------
			//                  Fichiers MULTI COLONNES
			//---------------------------------------
			
			
			If ($SaveBlob=True:C214)
				ARRAY TEXT:C222(_Format; 0)
				C_TEXT:C284($Format1)
				C_TEXT:C284($Format2)
				C_TEXT:C284($Comments1)
				C_TEXT:C284($Comments2)
				$DocPath:=$ResourcesFolder+"FakeFormats.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $Format1; Char:C90(Tab:K15:37))
						
						//traitement du LF éventuel
						If ($Format1#"")
							If ($Format1[[1]]=Char:C90(10))
								$Format1:=Substring:C12($Format1; 2)
							End if 
						End if 
						RECEIVE PACKET:C104($DocRef; $Format2; Char:C90(Tab:K15:37))
						RECEIVE PACKET:C104($DocRef; $Comments1; Char:C90(Tab:K15:37))
						RECEIVE PACKET:C104($DocRef; $Comments2; Char:C90(Carriage return:K15:38))
						
						If ($Format2#"")
							APPEND TO ARRAY:C911(_Format; $Format1+Char:C90(Tab:K15:37)+$Format2)
						Else 
							APPEND TO ARRAY:C911(_Format; $Format1)  //meme si = ""
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeFormats.txt” !")
				End if 
			End if 
			
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				//ARRAY STRING(80;_company1;0)
				//ARRAY STRING(80;_company2;0)
				//ARRAY STRING(80;_company3;0)
				ARRAY TEXT:C222(_company1; 0)
				ARRAY TEXT:C222(_company2; 0)
				ARRAY TEXT:C222(_company3; 0)
				C_TEXT:C284($company1; $company2; $company3)
				
				$DocPath:=$ResourcesFolder+"FakeCompanies.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $company1; Char:C90(Tab:K15:37))
						If ($company1#"")
							//traitement du LF éventuel
							If ($company1[[1]]=Char:C90(10))
								$company1:=Substring:C12($company1; 2)
							End if 
							RECEIVE PACKET:C104($DocRef; $company2; Char:C90(Tab:K15:37))
							RECEIVE PACKET:C104($DocRef; $company3; Char:C90(Carriage return:K15:38))
							
							//Si (ok=1)
							APPEND TO ARRAY:C911(_company1; $company1)
							APPEND TO ARRAY:C911(_company2; $company2)
							APPEND TO ARRAY:C911(_company3; $company3)
							//Fin de si 
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeCompanies.txt” !")
				End if 
			End if 
			
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				ARRAY TEXT:C222(_ZipCode; 0)
				ARRAY TEXT:C222(_City; 0)
				ARRAY TEXT:C222(_State; 0)
				ARRAY TEXT:C222(_Country; 0)
				C_TEXT:C284($ZipCode; $City; $State; $Country)
				
				$DocPath:=$ResourcesFolder+"FakeCities.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $ZipCode; Char:C90(Tab:K15:37))
						If ($ZipCode#"")
							//traitement du LF éventuel
							If ($ZipCode[[1]]=Char:C90(10))
								$ZipCode:=Substring:C12($ZipCode; 2)
							End if 
							RECEIVE PACKET:C104($DocRef; $City; Char:C90(Tab:K15:37))
							RECEIVE PACKET:C104($DocRef; $State; Char:C90(Tab:K15:37))
							RECEIVE PACKET:C104($DocRef; $Country; Char:C90(Carriage return:K15:38))
							
							//Si (ok=1)
							APPEND TO ARRAY:C911(_ZipCode; $ZipCode)
							APPEND TO ARRAY:C911(_City; $City)
							APPEND TO ARRAY:C911(_State; $State)
							APPEND TO ARRAY:C911(_Country; $Country)
							//Fin de si 
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeCities.txt” !")
				End if 
			End if 
			
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				ARRAY TEXT:C222(_TitleM; 0)
				ARRAY TEXT:C222(_TitleMabr; 0)
				ARRAY TEXT:C222(_TitleF; 0)
				ARRAY TEXT:C222(_TitleFabr; 0)
				C_TEXT:C284($Title; $TitleAbr; $Sex)
				
				$DocPath:=$ResourcesFolder+"FakeTitles.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $Title; Char:C90(Tab:K15:37))
						If ($Title#"")
							//traitement du LF éventuel
							If ($Title[[1]]=Char:C90(10))
								$Title:=Substring:C12($Title; 2)
							End if 
							RECEIVE PACKET:C104($DocRef; $TitleAbr; Char:C90(Tab:K15:37))
							RECEIVE PACKET:C104($DocRef; $Sex; Char:C90(Carriage return:K15:38))
							
							//Si (ok=1)
							If ($Sex="0")
								APPEND TO ARRAY:C911(_TitleM; $Title)
								APPEND TO ARRAY:C911(_TitleMabr; $TitleAbr)
							Else 
								APPEND TO ARRAY:C911(_TitleF; $Title)
								APPEND TO ARRAY:C911(_TitleFabr; $TitleAbr)
							End if 
							//Fin de si 
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeTitles.txt” !")
				End if 
			End if 
			
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				ARRAY TEXT:C222(_FirstNameM; 0)
				ARRAY TEXT:C222(_FirstNameF; 0)
				C_TEXT:C284($Firstname; $Sex)
				
				$DocPath:=$ResourcesFolder+"FakeFirstNames.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $Firstname; Char:C90(Tab:K15:37))
						If ($Firstname#"")
							//traitement du LF éventuel
							If ($Firstname[[1]]=Char:C90(10))
								$Firstname:=Substring:C12($Firstname; 2)
							End if 
							RECEIVE PACKET:C104($DocRef; $Sex; Char:C90(Carriage return:K15:38))
							
							//Si (ok=1)
							If ($Sex="0")
								APPEND TO ARRAY:C911(_FirstNameM; $Firstname)
							Else 
								APPEND TO ARRAY:C911(_FirstNameF; $Firstname)
							End if 
							//Fin de si 
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeFirstNames.txt” !")
				End if 
			End if 
			
			
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				
				ARRAY TEXT:C222(_FakeText; 0)
				C_TEXT:C284($FakeText)
				$DocPath:=$ResourcesFolder+"FakeText.txt"
				If (Test path name:C476($DocPath)=Is a document:K24:1)
					$DocRef:=Open document:C264($DocPath)
					Repeat 
						RECEIVE PACKET:C104($DocRef; $FakeText; ".")
						If ($FakeText#"")
							Repeat 
								$ok:=0
								If ($FakeText[[1]]=" ") | ($FakeText[[1]]=Char:C90(13)) | ($FakeText[[1]]=Char:C90(10))
									$FakeText:=Substring:C12($FakeText; 2)
								Else 
									$ok:=1
								End if 
							Until ($ok=1) | ($FakeText="")
							
							If ($FakeText#"")
								APPEND TO ARRAY:C911(_FakeText; $FakeText+".")
							End if 
						Else 
							ok:=0
						End if 
					Until (ok=0)
					CLOSE DOCUMENT:C267($DocRef)
				Else 
					$SaveBlob:=False:C215
					ALERT:C41("Pas de “FakeText.txt” !")
				End if 
			End if 
			
			
			
			
			
			
			
			
			//-------------------------------------------------------------------------------------
			//-------------------------------------------------------------------------------------
			
			If ($SaveBlob=True:C214)
				//on crée le Blob pour la prochaine fois
				
				$BlobPath:=$ResourcesFolder+"FakeData.blob"
				If (Test path name:C476($BlobPath)=Is a document:K24:1)
					DELETE DOCUMENT:C159($BlobPath)
				End if 
				
				C_BLOB:C604($Blob)
				
				$Offset:=0
				VARIABLE TO BLOB:C532(_StreetType; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_StreetName; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_company1; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_company2; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_company3; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_ZipCode; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_City; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_State; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_Country; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_TitleM; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_TitleMabr; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_TitleF; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_TitleFabr; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_FirstNameM; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_FirstNameF; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_LastName; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_Suffix; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_Job; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_Department; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_FakeText; $Blob; $Offset)
				
				VARIABLE TO BLOB:C532(_Format; $Blob; $Offset)
				
				VARIABLE TO BLOB:C532(_portraitsF0; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsF1; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsF2; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsF3; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsM0; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsM1; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsM2; $Blob; $Offset)
				VARIABLE TO BLOB:C532(_portraitsM3; $Blob; $Offset)
				
				//COMPRESS BLOB($Blob)
				BLOB TO DOCUMENT:C526($BlobPath; $Blob)
				
				$Loop:=2  //exit loop
				
			End if 
		End if 
		
	End for 
	
	
	//Traitement du tableau des formats qui "overwrite" le tableau des formats
	If (Not:C34(Is nil pointer:C315($PtrArray)))
		
		$n:=Size of array:C274(_Format)
		If (Size of array:C274($PtrArray->)=$n)
			
			For ($i; 1; $n)
				If ($PtrArray->{$i}#"")
					_Format{$i}:=$PtrArray->{$i}
				End if 
			End for 
		Else 
			ALERT:C41("The format array has not the same size as the template one ("+String:C10($n)+")")
		End if 
	End if 
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------
	//          Paths for images portraits  (Never saved inside blob because it's a full path)
	//---------------------------------------------------------------------------------------------------------------------
	
	ARRAY TEXT:C222(_portraitsF0; 0)
	ARRAY TEXT:C222(_portraitsF1; 0)
	ARRAY TEXT:C222(_portraitsF2; 0)
	ARRAY TEXT:C222(_portraitsF3; 0)
	
	ARRAY TEXT:C222(_portraitsM0; 0)
	ARRAY TEXT:C222(_portraitsM1; 0)
	ARRAY TEXT:C222(_portraitsM2; 0)
	ARRAY TEXT:C222(_portraitsM3; 0)
	
	ARRAY TEXT:C222($_paths; 8)
	
	$_paths{1}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"F"+Folder separator:K24:12+"0"+Folder separator:K24:12
	$_paths{2}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"F"+Folder separator:K24:12+"1"+Folder separator:K24:12
	$_paths{3}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"F"+Folder separator:K24:12+"2"+Folder separator:K24:12
	$_paths{4}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"F"+Folder separator:K24:12+"3"+Folder separator:K24:12
	$_paths{5}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"M"+Folder separator:K24:12+"0"+Folder separator:K24:12
	$_paths{6}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"M"+Folder separator:K24:12+"1"+Folder separator:K24:12
	$_paths{7}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"M"+Folder separator:K24:12+"2"+Folder separator:K24:12
	$_paths{8}:=Get 4D folder:C485(Current resources folder:K5:16)+"Portraits"+Folder separator:K24:12+"M"+Folder separator:K24:12+"3"+Folder separator:K24:12
	
	ARRAY POINTER:C280($_arrPtr; 8)
	$_arrPtr{1}:=->_portraitsF0
	$_arrPtr{2}:=->_portraitsF1
	$_arrPtr{3}:=->_portraitsF2
	$_arrPtr{4}:=->_portraitsF3
	$_arrPtr{5}:=->_portraitsM0
	$_arrPtr{6}:=->_portraitsM1
	$_arrPtr{7}:=->_portraitsM2
	$_arrPtr{8}:=->_portraitsM3
	
	For ($i; 1; 8)
		ARRAY TEXT:C222($_DocNames; 0)
		DOCUMENT LIST:C474($_paths{$i}; $_DocNames)
		$n:=Size of array:C274($_DocNames)
		For ($j; 1; $n)
			APPEND TO ARRAY:C911($_arrPtr{$i}->; $_paths{$i}+$_DocNames{$j})
		End for 
	End for 
	
	
Else 
	ALERT:C41("The “Resources” folder has not been found !")
End if 


//Else 
//ALERT("The localisation ($1) parameter is missing")
//End if 
