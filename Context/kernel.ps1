Add-Type -AssemblyName "System.Windows.Forms";
$Global:RC_CorePath = 'D:\$KERNEL\dll\RC.Core.dll';
$Global:VersionKernel = "0.15.50";

$Global:RC = [System.Reflection.Assembly]::LoadFrom($RC_CorePath);

function Init([bool]$enlableVTP) 
{
    if ($enlableVTP) { [RC.Framework.Screens.RCL]::EnablingVirtualTerminalProcessing(); }
}
function global:WriteCTX() 
{ 
    [System.Object]$o = "CXT";
    [System.Drawing.Color]$c = [System.Drawing.Color]::DarkOrchid;
    [Rc.Framework.Screens.Screen]::Write("[" + [Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + "]");
}
function global:Info ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[#]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::CadetBlue;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
function global:Log ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[~]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::Gray;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
function global:Passed ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[%]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::GreenYellow;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
function global:Qutarion ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[?]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::MediumPurple;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
function global:Warning ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[!]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::Orange;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
function global:Error ([System.Object]$obj) 
{ 
    WriteCTX
    [System.Object]$o = "[&]";
    [System.Drawing.Color]$c = [System.Drawing.Color]::Red;
    [Rc.Framework.Screens.Screen]::WriteLine([Rc.Framework.Screens.RCL]::Wrap([System.Object]$o, [System.Drawing.Color]$c)  + " " + $obj);
}
Init -enlableVTP $true

Info "Kernel initialized complete!";
Info ("Kernel Version: " + $Global:VersionKernel);