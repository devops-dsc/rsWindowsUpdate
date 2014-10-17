

function Test-rsRegistryValue {

param (

 [parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Path,

[parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Value
)

    if(Test-Path $Path){
        
        try {

        Get-ItemProperty $Path -Name $Value -ErrorAction Stop | Out-Null
        return $true
         
         }

        catch {

        return $false

        }

        }
    else{return $false}
    }


function Get-rsRegistryValue {

param (

 [parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Path,

[parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Value
)

    if(Test-Path $Path){
        
        try {

         Get-ItemProperty $Path -Name $Value -ErrorAction Stop | Select-Object -ExpandProperty $Value -ErrorAction Stop
                 
         }

        catch {}

        }
    }






function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
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
        
        [parameter(Mandatory = $true)]
		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	
	$configuration = @{
		AUOptions = $AUOptions
		NoRebootWithLoggedOnUsers = $NoRebootWithLoggedOnUsers
		NoAutoUpdate = $NoAutoUpdate
		ScheduledInstallDay = $ScheduledInstallDay
		ScheduledInstallTime = $ScheduledInstallTime
		WUServer = $WUServer
		WUStatusServer = $WUStatusServer
		UseWUServer = $UseWUServer
		Ensure = $Ensure
	}

	return $configuration
	
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
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

        [parameter(Mandatory = $true)]
		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	if($Ensure -like "Absent"){
		if(Test-Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU){
            Remove-Item HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Force
        }
			
		if(Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUServer){
		    Remove-ItemProperty HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Name WUServer 
        }
		
		if(Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUStatusServer){
		    Remove-ItemProperty HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Name WUStatusServer
        }
	}

	if($Ensure -like "Present"){
	
		if(!(Test-Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU)){
            New-Item -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU
        }
			
		if(Test-Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU){

			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name AUOptions) -ne $AUOptions){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name AUOptions -Value $AUOptions
            }
            		
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoRebootWithLoggedOnUsers) -ne $NoRebootWithLoggedOnUsers){
                Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoRebootWithLoggedOnUsers -Value $NoRebootWithLoggedOnUsers
            }
			
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value NoAutoUpdate) -ne $NoAutoUpdate){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value $NoAutoUpdate
            }
				
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value ScheduledInstallDay) -ne $ScheduledInstallDay){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name ScheduledInstallDay -Value $ScheduledInstallDay
            }
				
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value ScheduledInstallTime) -ne $ScheduledInstallTime){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name ScheduledInstallTime -Value $ScheduledInstallTime
            }
				
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUServer) -ne $WUServer){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Name WUServer -Value $WUServer
            }
				
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUStatusServer) -ne $WUStatusServer){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Name WUStatusServer -Value $WUStatusServer
            }
				
			if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value UseWUServer) -ne $UseWUServer){
				Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value $UseWUServer
            }				
	    }
    }
}

function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
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
        
        [parameter(Mandatory = $true)]
		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."

	
	if($Ensure -like "Absent"){
		
        if(Test-Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU){
			return $false
        }
			
		if(Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUServer){
			return $false
        }
			
		if(Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUStatusServer){
			return $false
        }

		return $true		
			
	}
	
	
	
	if($Ensure -like "Present"){
	
		
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value AUOptions) -ne $AUOptions){
			return $false
        }
	
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Value NoRebootWithLoggedOnUsers) -ne $NoRebootWithLoggedOnUsers){
			return $false
        }
		
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value ScheduledInstallDay) -ne $ScheduledInstallDay){
			return $false
        }
			
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value ScheduledInstallTime) -ne $ScheduledInstallTime){
			return $false
        }
			
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUServer) -ne $WUServer){
			return $false
        }
			
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value WUStatusServer) -ne $WUStatusServer){
			return $false
        }
			
		if((Test-rsRegistryValue -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Value UseWUServer) -ne $UseWUServer){
			return $false
        }
	}

	
    else{	
	    return $true
    }
	

}


Export-ModuleMember -Function *-TargetResource