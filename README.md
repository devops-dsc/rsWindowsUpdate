rsWebConfiguration
==================
```PoSh

#rsWindowsUpdate will create registry settings for updates or update existing settings if they do not match config
#Setting Ensure to "Absent" will delete the HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU key as well as the values for WUServer and WUStatusServer under HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate. Effectively setting Windows Update back to factory install.
#The Ensure attribute is the only REQUIRED attribute - Everything else is optional / combinable
# See http://technet.microsoft.com/en-us/library/dd939844%28v=ws.10%29.aspx for reg values to input



Configure Windows Update install and reboot, leaving all other settings to default/existing

rsWindowsUpdate set_options
{
	Ensure = "Present"
	AUOptions = "4"
}



Configure Windows Update to pull from Microsoft WSUS server

rsWindowsUpdate set_options
{
	Ensure = "Present"
	AUOptions = "4"
	NoRebootWithLoggedOnUsers = "0"
	NoAutoUpdate = "0"
	ScheduledInstallDay = "2"
	ScheduledInstallTime = "20"
	UseWUServer = "0"
}



Configure Windows Update to pull from specific WSUS server (customer or RAX for Dedicated)

rsWindowsUpdate set_options
{
	Ensure = "Present"
	AUOptions = "4"
	NoRebootWithLoggedOnUsers = "0"
	NoAutoUpdate = "0"
	ScheduledInstallDay = "2"
	ScheduledInstallTime = "20"
	WUServer = "https://mywsusserver.contoso.local"
	WUStatusServer = "https://mywsusserver.contoso.local"
	UseWUServer = "1"
}



Remove Windows Update settings


rsWindowsUpdate remove_settings
{
	Ensure = "Absent"
}

