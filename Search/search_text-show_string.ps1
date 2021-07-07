###########################################################

$Path = "D:\AROBS\Tools\ATP_var2\ATP_2.7.1\Reports"
$SearchText = "/usr/sbin/btsvc_main_9300"
$OutFile = "/log"
$PathArray = @()
$i=0

########## Check if file for Transcript all ready exist ##############

$Temp = $OutFile
for($j=0; $j -lt $j+1; $j++){
  if( Test-Path $($Path + $Temp + '.txt') -PathType leaf) {
    Write-Output $($Temp + '.txt')
    $Temp = $OutFile + "_" + $j.ToString()
  }
  else{  break  }
}

Start-Transcript -Path $(New-Item $($Path + $Temp + '.txt')).FullName -Append

# This code snippet gets all the files in $Path that end in ".txt".
Get-ChildItem $Path -Filter "*.txt" -Recurse |
Where-Object { $_.Attributes -ne "Directory"} |
ForEach-Object {
  If (Get-Content $_.FullName | Select-String -Pattern $SearchText) {
    $PathArray += $(Get-Content $_.FullName | Select-String -Pattern $SearchText)
    $i = $i  +  1 
  }
}
Write-Host "Contents of ArrayPath:"
$PathArray | ForEach-Object {$_}
Write-Output "i = $i"

Stop-Transcript 

###########################################################