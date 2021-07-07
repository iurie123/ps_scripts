$SomePath="D:\new_IT\prog_for_work\COSEM_Client\353\CC_353_1_CezRoSS1\Log"
Get-ChildItem -Path ${SomePath} -Recurse -Force | 
Remove-Item -Force -Recurse