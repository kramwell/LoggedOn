# LoggedOn
 12/JAN/2018 - Script will check who is logged on to every computer in Active Directory and output the usernames, os version and user logon time.

Sample ACTIVEUSERS.csv output

	ComputerName,Domain,Username,LogonTime,OSType
	KWNB0120,KWTECH,frank,26/01/2018 13:58,Microsoft Windows 7 Enterprise 
	KWNB0130,KWTECH,brian,26/01/2018 20:06,Microsoft Windows 7 Enterprise 
	KWNB0134,KWTECH,terry,26/01/2018 16:51,Microsoft Windows 7 Enterprise 
	KWNB0138,KWTECH,jones,26/01/2018 15:17,Microsoft Windows 7 Enterprise 
	KWNB0140,KWTECH,sarah,26/01/2018 16:56,Microsoft Windows 7 Enterprise 
	KWNB0145,KWTECH,mary,26/01/2018 17:03,Microsoft Windows 7 Enterprise 
	KWNB0148,KWTECH,david,26/01/2018 17:38,Microsoft Windows 7 Enterprise 
	KWNB0155,KWTECH,ivan,22/01/2018 15:20,Microsoft Windows 7 Enterprise 
	KWNB0156,KWTECH,patrick,26/01/2018 16:11,Microsoft Windows 7 Enterprise 
	KWNB0201,KWTECH,paul,26/01/2018 15:44,Microsoft Windows 7 Enterprise 

Sample history/%timestamp%.txt output

	**********************
	Windows PowerShell Transcript Start
	Start time: 20180126211223
	Username  : KWTECH\kramwell 
	Machine	  : KWWS0209 (Microsoft Windows NT 6.1.7601 Service Pack 1) 
	**********************
	Transcript started, output file is history\11-27-2017_10-41-39.txt
	(1) of (10) KWNB0036 Turned Off
	(2) of (10) KWNB010 Turned Off
	(3) of (10) KWNB0100 OK
	(4) of (10) KWNB0101 ERROR
	(5) of (10) KWNB0102 OK
	(6) of (10) KWNB0104 Turned Off
	(7) of (10) KWNB0105 OK
	(8) of (10) KWNB0106 ERROR
	(9) of (10) KWNB0107 OK
	(10) of (10) KWNB0108 Turned Off
	**********************
	Windows PowerShell Transcript End
	End time: 20180126212226
	**********************
