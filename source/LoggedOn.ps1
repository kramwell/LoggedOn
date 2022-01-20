#Written by KramWell.com - 12/JAN/2018
#Script will check who is logged on to every computer in Active Directory and output the usernames, os version and user logon time.

$delay = "100"
$OutArray = @()
$CSVFile = "ACTIVEUSERS.csv"

$countComputers = 0

if(Test-Path $CSVFile) {
	#Remove file beforecreating a new one.
	Remove-Item -path $CSVFile
}

Import-Module ActiveDirectory

#here we get ad computer list and loop by that.
$ADComputers = Get-ADComputer -Filter {Name -like "*"} -Property Name

$LogTime = Get-Date -Format "MM-dd-yyyy_HH-mm-ss"
$LogTime = "history\" + $LogTime + ".txt"
Start-Transcript -path $LogTime -append

#loop for-each computer found
Foreach ($Computer in $ADComputers)
{

	$countComputers++

	#Write-Output $countComputers
	#Write-Output $Computer.Name

	#ping setup
	$ping = new-object System.Net.NetworkInformation.Ping

	try {
	
		$CountDisplay = "(" + $countComputers  + ") of (" + $ADComputers.Count + ") "
	
		If ($ping.send($Computer.Name,$delay).status -ne "Success") {
			$CountDisplay + $Computer.Name + " Turned Off"
		} Else {
			$explorerprocesses = @(Get-WmiObject -ComputerName $Computer.Name -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ErrorAction SilentlyContinue)
			If ($explorerprocesses.Count -eq 0) {
				$CountDisplay + $Computer.Name + " Nobody logged on"
			} Else {
				#loop for each user based on explorer.exe
				ForEach ($i in $explorerprocesses)
				{
					# Construct an object
					$myobj = "" | Select ComputerName, Domain, Username, LogonTime, OSType

					# Fill the object
					$myobj.ComputerName = $Computer.Name
					$myobj.Domain = $i.GetOwner().Domain
					$myobj.Username = $i.GetOwner().User
					$myobj.LogonTime = $($i.ConvertToDateTime($i.CreationDate))
					$myobj.OSType = $i.OSName.Split("|")[0]

					# Add the object to the out-array
					$OutArray += $myobj

					# Wipe the object just to be sure
					$myobj = $null
				}

				# After the loop, export the array to CSV
				$OutArray | export-csv -NoTypeInformation $CSVFile
				
				$CountDisplay + $Computer.Name + " OK"
			}
		}
	} catch {
		$CountDisplay + $Computer.Name + " ERROR"
	}


}

Stop-Transcript