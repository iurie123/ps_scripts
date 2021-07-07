#init path; remove file with exclude parameter
$sp = @("","")
$sp[0] = "E:\Logs\DltViewer\Logs"
$sp[1] = "E:\Logs\ZOC8_info\Log"
#$sp = @("")
#$sp[0] = "D:\AROBS\Tools\ATP_var2\ATP_2.7.1\Reports"

for($i=0; $i -lt 2; $i++) {
  Write-Output "detect intruder file from path: $($sp[$i]) " "--> "
  Get-ChildItem -Path $($sp[$i]+"\*") -Recurse -Force -Exclude "*21-06-03*" |
  Select-Object FullName #for display in console intruder file
  #Remove-Item -Force -Recurse #for remove without displaying
  Write-Output ""

  #remove emty folder
  
  Write-Output "detect empty folder from path:  $($sp[$i]) " "--> "
  Get-ChildItem -Path $sp[$i] -Recurse |
  Where-Object {$_.PSIsContainer -eq $True} | 
  Where-Object {($_.GetFiles().Count -eq 0) -and ($_.GetDirectories().Count -eq 0)} |
  Select-Object FullName #for display in console emty folder
  #Foreach-Object {Remove-Item $_.FullName -Recurse} #for remove without displaying
  Write-Output ""
}
