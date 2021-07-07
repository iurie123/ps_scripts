#init path; remove file with exclude parameter
$sp = @("","")
$sp[0] = "D:\AROBS\Tools\Logs\DltViewer\Logs"
$sp[1] = "D:\AROBS\Tools\Logs\ZOC8_info\Log\*"


for($i=0; $i -lt 2; $i++){
  Write-Output "detect intruder file from path: $($sp[$i]) " "--> "
  Get-ChildItem -Path $($sp[$i]+"\*") -Recurse -Force -Exclude "*21-03-02*" |
  Select-Object FullName #for display in console intruder file
  #Remove-Item -Force -Recurse #for remove without displaying
  Write-Output ""
}
