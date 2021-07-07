#init path; remove file with exclude parameter
$sp = @("","","","","")
$sp[0] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_0\Log"
$sp[1] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_1\Log"
$sp[2] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_2\Log"
$sp[3] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_3\Log"
$sp[4] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_4\Log"

for($i=0; $i -lt 5; $i++){
    Write-Output "detect intruder file from path: $($sp[$i]) " "--> "
    Get-ChildItem -Path $($sp[$i]+"\*\*xml*") -Recurse -Force -Exclude *_2021*01*11.xml |
    Select-Object FullName #for display in console intruder file
    #Remove-Item -Force -Recurse #for remove without displaying
    echo ""
    
    #remove emty folder
    
    Write-Output "detect empty folder from path:  $($sp[$i]) " "--> "
    Get-ChildItem -Path $sp[$i] -Recurse |
    Where-Object {$_.PSIsContainer -eq $True} | 
    Where-Object {($_.GetFiles().Count -eq 0) -and ($_.GetDirectories().Count -eq 0)} |
    Select-Object FullName #for display in console emty folder
    #Foreach-Object {Remove-Item $_.FullName -Recurse} #for remove without displaying
    echo ""
}