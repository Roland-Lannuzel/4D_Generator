//%attributes = {}
FakeData_ArraysInit("en")

C_OBJECT:C1216($template; $contact)

$template:=New object:C1471

$template.Genre:="gender"
$template.Titre:="title"
$template.Prénom:="firstname"
$template.SecondPrénom:="firstname"
$template.Suffixe:="suffix"
$template.NomDeFamille:="lastname"
$template.Courriel:="email"
$template.Société:="company"
$template.Département:="department"
$template.Métier:="jobType"
$template.Adresse:="address"
$template.CodePostal:="zipCode"
$template.Ville:="city"
$template.État:="state"
$template.Pays:="country"

$template.TelFixe:="phone"
$template.Fax:="phone"
$template.Celullaire:="phone"


$template.photo0:="portrait0"
$template.photo1:="portrait1"
$template.photo2:="portrait2"
$template.photo3:="portrait3"


$template.zTextCourt:="textShort"
$template.zTextMoyen:="textMedium"
$template.zTextLong:="textLong"

$template.zlong1:="longint1"
$template.zlong2:="longint2"
$template.zReal1:="real1"
$template.zReal2:="real2"


$template.xDate1:="date"
$template.xDate2:="date"
$template.xDate3:="date"
$template.xDate4:="date"
$template.xDate5:="date"

$template.zTime:="time"
$template.zDuration:="duration"

$template.zBool:="boolean"

$contact:=New object:C1471

FakeData_FillObjectTemplate($template; $contact)


FakeData_ArraysDeinit
