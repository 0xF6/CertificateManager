function global:MakeChlidCert ([string]$RootCertName, [string]$ChlidCertName, [string]$CertCN) 
{
    .\makecert -iv ($RootCertName + ".pvk") -n ('CN="' + $CertCN + '"') -ic ($RootCertName + ".cer") -sv ($ChlidCertName + ".pvk") -ss My ($ChlidCertName + ".cer")
}
Info "MakeCert [MakeChlidCert] loaded."