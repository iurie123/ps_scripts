#init path; remove file with exclude parameter
$sp = @("","")
$sp[0] = "E:\Logs\DltViewer\Logs"
$sp[1] = "E:\Logs\ZOC8_info\Log"

for($i=0; $i -lt 5; $i++){
  Write-Output "detect intruder file from path: $($sp[$i]) " "--> "
  if($i -lt 1) {
    Get-ChildItem -Path $($sp[$i]+"\*.dlt") -Recurse -Force -Exclude 2021*02*25* |
    Select-Object FullName #for display in console intruder file
    #Remove-Item -Force -Recurse #for remove without displaying
    Write-Output ""
  }
  else {
    Get-ChildItem -Path $($sp[$i]+"\*.LOG") -Recurse -Force -Exclude *25d*02m* |
    Select-Object FullName #for display in console intruder file
    #Remove-Item -Force -Recurse #for remove without displaying
    Write-Output ""  
  }

  #remove emty folder
  
  #Write-Output "detect empty folder from path:  $($sp[$i]) " "--> "
  #Get-ChildItem -Path $sp[$i] -Recurse |
  #Where-Object {$_.PSIsContainer -eq $True} | 
  #Where-Object {($_.GetFiles().Count -eq 0) -and ($_.GetDirectories().Count -eq 0)} |
  #Select-Object FullName #for display in console emty folder
  ##Foreach-Object {Remove-Item $_.FullName -Recurse} #for remove without displaying
  #echo ""
}