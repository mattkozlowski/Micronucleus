$URL = "https://www.torproject.org/dist/torbrowser/12.0.2/torbrowser-install-win64-12.0.2_ALL.exe"
$Path = [Environment]::GetFolderPath("Desktop") + "\torbrowser.exe"
Invoke-WebRequest -URI $URL -OutFile $Path
Start-Process $Path 