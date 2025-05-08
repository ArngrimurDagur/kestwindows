#Import required Modules
Import-Module ActiveDirectory
#Create a new pasword
$securepass = ConvertTo-SecureString 'P@ssword2024' -AsPlainText -Force
#Prompt the user for CSV file path
$filepath = Read-Host -Prompt 'Please Enter Your csv file Path'
#Import the file into a variable
$Users = Import-Csv $filepath
#loop through each row of csv file
foreach ($user in $Users){
 $fname = $user.FirstName
 $lname = $user.LastName
 $Jtitle = $user.'Job Title'
 $Ophone = $user.'Office Phone'
 $email = $user.'Email Address'
 $desc = $user.Description
 $dnsroot = '@'+ (Get-ADDomain).dnsroot
 $dept = $user.Department
 $upn = $fname.Substring(0,2) + $lname.Substring(0,1) + $dnsroot
 $ou = $("ou=" + $dept + ",ou=Reykjavik,dc=abdel,dc=local")
 if(-not(Get-ADOrganizationalUnit -filter {name -like $dept})){
 #Create the OU if it does not exist
 New-ADOrganizationalUnit -name $dept -Path "ou=Reykjavik,dc=abdel,dc=local"
 #Create new group
 New-ADGroup -name $dept -path $ou -GroupScope Global
 }
 new-aduser -Name "$fname" -GivenName $fname -Surname $lname -UserPrincipalName $upn -Path $ou -
AccountPassword $securepass -ChangePasswordAtLogon $true -OfficePhone $Ophone -Description $desc -
Enabled $true
 echo "Account created for "$fname $lname in $dept""
 Add-ADGroupMember -Identity $dept -Members $fname
}
