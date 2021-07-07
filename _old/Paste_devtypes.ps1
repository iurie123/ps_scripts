$cc = @("","","","","","")
$cc[0] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_0\DevTypes"
$cc[1] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_1\DevTypes"
$cc[2] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_2\DevTypes"
$cc[3] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_3\DevTypes"
$cc[4] = "D:\new_IT\prog_for_work\COSEM_Client\354\CC_354_4\DevTypes"

for($i=0; $i -lt 5; $i++){ Get-Clipboard -Format FileDropList | cp -Destination $cc[$i] }
