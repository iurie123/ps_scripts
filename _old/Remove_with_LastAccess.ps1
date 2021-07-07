#Дата с которой сравнивать. В этом случае -35 дней от текущей даты
$date = (Get-Date).AddDays(-5)
#Или дата кастомная. Пустые значения будут взяты из текущего времени и даты
#$date = Get-Date -Year 2020 -Month 11 -Day 26 -Hour 22 -Minute 13
#Путь до директории откуда удалять файлы
$path = "C:\Users\iurie.topor\Downloads"
#Удаление всех файлов и папок (в т.ч. внутри папок) старше чем значение в $date
Get-ChildItem  -Path $path | 
where  -Property Mode -NE d----- |
where -Property Mode -NE d-r---  |
Where-Object -Property LastAccessTime -LT $date 
#Remove-Item
