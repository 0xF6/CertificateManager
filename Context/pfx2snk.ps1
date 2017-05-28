$Global:pfx2snk = @"
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.IO;
public static class Sign
{
    public static void Pfx2Snk(string fileNamePFX, string Password)
    {
        var ph = Path.GetDirectoryName(fileNamePFX);
        var ws = Path.GetFileNameWithoutExtension(fileNamePFX) + ".snk";
        var bt = Sign.cvt(File.ReadAllBytes(fileNamePFX), Password);

        System.Console.WriteLine(ph);
        System.Console.WriteLine(ws);
        System.Console.WriteLine(bt);
        System.Console.WriteLine(Path.Combine(ph, ws));

        File.WriteAllBytes(Path.Combine(ph, ws), bt);
    }

    private static byte[] cvt(byte[] pfxData, string pfxPassword)
    {
        var cert = new X509Certificate2(pfxData, pfxPassword, X509KeyStorageFlags.Exportable);
        var privateKey = (RSACryptoServiceProvider)cert.PrivateKey;
        return privateKey.ExportCspBlob(true);
    }
}
"@
Add-Type -TypeDefinition $Global:pfx2snk
function global:PFX2SNK ([string]$pathToPfx, [string]$pass) 
{
    [Sign]::Pfx2Snk($Global:PWD.Path + "\" + $pathToPfx, $pass);
}
Info "Sign tools [pfx2snk] loaded."