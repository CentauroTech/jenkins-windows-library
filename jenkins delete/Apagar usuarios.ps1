def delete(Map map = [:], path){
    def debug =  map.debug ?: false

    def exist = fileExist(map, path)
    if (exist) {
        powershell "Invoke-Command -ComputerName $server -ScriptBlock  {Get-WMIObject -class Win32_UserProfile | Where {(!$_.Special) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-5))} | Remove-WmiObject}"
    }
} 