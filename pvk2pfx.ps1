param([string]$CertName, [string]$pass)
.\Context.ps1
PVKTOPFX $CertName $pass
Warning "Complete!";