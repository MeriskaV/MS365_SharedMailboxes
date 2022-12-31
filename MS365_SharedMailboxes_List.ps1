Install-Module ExchangeOnlineManagement 
Import-Module ExchangeOnlineManagement
Install-Module MSOnline
Import-Module MSOnline

Connect-ExchangeOnline
Connect-msolservice

#Site Admin Credentials:
# xxxxxxx@xxxxx.xxx (e-mail)
# xxxxxxxx (password)

$DataPath = "C:\temp\final.csv"

$sharedmailboxes=Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited | Get-MailboxPermission |Select-Object Identity, User, AccessRights | Where-Object {($_.user -like '*@*')} 
 
$sharedmailboxes |Export-Csv -NoTypeInformation -Path $DataPath 
