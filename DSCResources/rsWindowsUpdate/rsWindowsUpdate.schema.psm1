Configuration rsWindowsUpdate
{
	param
	(
		[ValidateSet("2","3","4","5")]
		[System.String]
		$AUOptions,

		[ValidateSet("0","1")]
		[System.String]
		$NoAutoRebootWithLoggedOnUsers,

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
    
    $WUKey = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate"
    $WUAUKey = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"

    if ( $psBoundParameters.ContainsKey('ScheduledInstallTime') ) {    
      Registry ScheduleInstallTime
      {       
          Ensure = $Ensure
          Key = $WUAUKey
          ValueName = "ScheduledInstallTime"
          ValueData = [string] $ScheduledInstallTime
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('ScheduledInstallDay') ) {  
      Registry ScheduledInstallDay
      {       
          Ensure = $Ensure
          Key = $WUAUKey
          ValueName = "ScheduledInstallDay"
          ValueData = [string] $ScheduledInstallDay
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('ScheduledInstallTime') ) {  
      Registry NoAutoUpdate
      {       
          Ensure = $Ensure
          Key = $WUAUKey
          ValueName = "NoAutoUpdate"
          ValueData = [string] $NoAutoUpdate
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('NoAutoRebootWithLoggedOnUsers') ) {  
      Registry NoAutoRebootWithLoggedOnUsers
      {       
          Ensure = $Ensure
          Key = $WUAUKey
          ValueName = "NoAutoRebootWithLoggedOnUsers"
          ValueData = [string] $NoAutoRebootWithLoggedOnUsers
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('AUOptions') ) {
      Registry AUOptions
      {       
          Ensure = $Ensure
          Key = $WUAUKey
          ValueName = "AUOptions"
          ValueData = [string] $AUOptions
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('WUServer') ) {
      Registry WUServer
      {       
          Ensure = $Ensure
          Key = $WUKey
          ValueName = "WUServer"
          ValueData = [string] $WUServer
          ValueType = "string"
      }
    }
    if ( $psBoundParameters.ContainsKey('UseWUServer') ) {
      Registry UseWUServer
      {       
          Ensure = $Ensure
          Key = $WUKey
          ValueName = "UseWUServer"
          ValueData = [string] $UseWUServer
          ValueType = "Dword"
      }
    }
    if ( $psBoundParameters.ContainsKey('WUStatusServer') ) {
      Registry WUStatusServer
      {       
          Ensure = $Ensure
          Key = $WUKey
          ValueName = "WUStatusServer"
          ValueData = [string] $WUStatusServer
          ValueType = "string"
      }
    }
}
       