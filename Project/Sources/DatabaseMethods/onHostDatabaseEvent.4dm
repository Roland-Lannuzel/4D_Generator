C_LONGINT:C283($1)
C_LONGINT:C283($HostEvent)

$HostEvent:=$1
Case of 
	: ($HostEvent=On before host database startup:K74:3)
		
	: ($HostEvent=On after host database startup:K74:4)
		FakeData_ArraysInit
		
	: ($HostEvent=On before host database exit:K74:5)
		FakeData_ArraysDeinit
		
	: ($HostEvent=On after host database exit:K74:6)
		
End case 

