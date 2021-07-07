###########################################################

$Path = "D:\AROBS\Tools\ATP_var2\ATP_2.7.1\Reports"
$Text = "/usr/sbin/btsvc_main_9300"
$NewFolder = "\Dlt_3\"
$OutFile = "log"
$PathArray = @()
$i=0

mkdir $($Path + $NewFolder)

########## Check if file for Transcript all ready exist ##############
$Temp = $OutFile
for($j=0; $j -lt $j+1; $j++){
  if( Test-Path $($Path + $NewFolder + $Temp + '.txt') -PathType leaf) {
    Write-Output $($Temp + '.txt')
    $Temp = $OutFile + "_" + $j.ToString()
  }
  else{  break  }
}
Start-Transcript -Path $(New-Item $($Path + $NewFolder + $Temp + '.txt')).FullName -Append

Get-ChildItem $Path -Filter "*COM4*.txt" -Recurse |
Where-Object { $_.Attributes -ne "Directory"} |
ForEach-Object {
  If (Get-Content $_.FullName | Select-String -Pattern $Text) {
    $PathArray += $_.FullName
    $i += 1 
    $Folder = Split-Path $_.DirectoryName -Leaf
    for($j=0; $j -lt $j+1; $j++){
      if( Test-Path -Path $($Path + $NewFolder + $Folder)) {
        $Folder = $(Split-Path $_.DirectoryName -Leaf) + "_" + $j.ToString()
      }
      else{ 
        mkdir $($Path + $NewFolder + $Folder) 
        break
      }
    }
    Copy-Item -Path $($_.DirectoryName + "\*") -Filter "*.dlt" -Destination $($Path + $NewFolder + $Folder + "\")
  }
}
Write-Host "Contents of ArrayPath:"
$PathArray | ForEach-Object {$_}
Write-Output "i = $i"

Stop-Transcript 

##########################################################