function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("2","3","4","5")]
		[System.String]
		$AUOptions
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$returnValue = @{
		AUOptions = [System.String]
		NoRebootWithLoggedOnUsers = [System.String]
		NoAutoUpdate = [System.String]
		ScheduledInstallDay = [System.String]
		ScheduledInstallTime = [System.String]
		WUServer = [System.String]
		WUStatusServer = [System.String]
		UseWUServer = [System.String]
		Ensure = [System.String]
	}

	$returnValue
	#>
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("2","3","4","5")]
		[System.String]
		$AUOptions,

		[ValidateSet("2","3")]
		[System.String]
		$NoRebootWithLoggedOnUsers,

		[ValidateSet("0","1")]
		[System.String]
		$NoAutoUpdate,

		[ValidateSet("0","1","2","3","4","5","6","7")]
		[System.String]
		$ScheduledInstallDay,

		[ValidateSet("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")]
		[System.String]
		$ScheduledInstallTime,

		[System.String]
		$WUServer,

		[System.String]
		$WUStatusServer,
		
		[ValidateSet("0","1")]
		[System.String]
		$UseWUServer,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."

	#Include this line if the resource requires a system reboot.
	#$global:DSCMachineStatus = 1


}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("2","3","4","5")]
		[System.String]
		$AUOptions,

		[ValidateSet("2","3")]
		[System.String]
		$NoRebootWithLoggedOnUsers,

		[ValidateSet("0","1")]
		[System.String]
		$NoAutoUpdate,

		[ValidateSet("0","1","2","3","4","5","6","7")]
		[System.String]
		$ScheduledInstallDay,

		[ValidateSet("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")]
		[System.String]
		$ScheduledInstallTime,

		[System.String]
		$WUServer,

		[System.String]
		$WUStatusServer,
		
		[ValidateSet("0","1")]
		[System.String]
		$UseWUServer,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$result = [System.Boolean]
	
	$result
	#>
}


Export-ModuleMember -Function *-TargetResource

