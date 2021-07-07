Start-Transcript -Path 'D:\new_IT\Z_TMP\Scripts\PS\Ping\Ping_Result_11.txt' -Append

$ServerName = Get-Content "D:\new_IT\Z_TMP\Scripts\PS\Ping\11_30.txt"  
  
foreach ($Server in $ServerName) {  
    if (test-Connection -ComputerName $Server -Count 1 -Quiet ) {   
        write-Host "$(Get-Date) | $Server is Pinging "  -ForegroundColor Green 
    } 
    else { 
        "$(Get-Date) | $Server not Pinging"  
    }      
}