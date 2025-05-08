Get-ADUser -SearchBase "OU=Reykjavik,DC=eep-<yourname>,DC=local" -Filter * | Remove-ADUser -Confirm:$false
