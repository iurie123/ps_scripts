###########################################################


$Path = "D:\AROBS\Tools\ATP_var2\ATP_2.7.1\Reports"
$Text = "/usr/sbin/btsvc_main_9300"
$PathArray = @()
$i=0

Start-Transcript -Path $(New-Item $($Path + '\LOG.txt')).FullName -Append

# This code snippet gets all the files in $Path that end in ".txt".
Get-ChildItem $Path -Filter "*COM4*.txt" -Recurse |
Where-Object { $_.Attributes -ne "Directory"} |
ForEach-Object {
  If (Get-Content $_.FullName | Select-String -Pattern $Text) {
    $PathArray += $_.FullName
    $i = $i  +  1 
  }
}
Write-Host "Contents of ArrayPath:"
$PathArray | ForEach-Object {$_}
Write-Output "i = $i"


###########################################################