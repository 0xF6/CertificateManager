function global:PVKTOPFX ([string]$CertName, [string]$pass) 
{
    .\pvk2pfx.exe /pvk ($CertName + ".pvk") /pi ($pass) /spc ($CertName + ".cer") /pfx ($CertName + ".pfx") /po ($pass)
}
Info "pvk to pfx [pvk2pfx] loaded."