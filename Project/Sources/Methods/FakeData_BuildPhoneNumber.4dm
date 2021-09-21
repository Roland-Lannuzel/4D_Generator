//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1)  //# (##) ##/### ## ##  ou encore ## ## ## #### ou bien encore (33) # ## ## ##
C_TEXT:C284($0)

C_TEXT:C284($Format)
C_LONGINT:C283($p)

If (Count parameters:C259>=1)
	$Format:=$1
Else 
	//test méthode
	$Format:="## (#) ### ## ###"
End if 

Repeat 
	$p:=Position:C15("#"; $Format)
	If ($p>0)
		$Format[[$p]]:=String:C10(Random:C100%10)
	End if 
Until ($p<=0)

$0:=$Format
