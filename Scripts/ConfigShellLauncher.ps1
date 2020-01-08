$AdminsSID = "S-1-5-32-544"
$ShellLauncherClass = [wmiclass]"\\localhost\root\standardcimv2\embedded:WESL_UserSetting"

function Get-UsernameSID($AccountName) {
$NTUserObject = New-Object System.Security.Principal.NTAccount($AccountName)
$NTUserSID = $NTUserObject.Translate([System.Security.Principal.SecurityIdentifier])
return $NTUserSID.Value
}

$RestartShell = 0
$RestartDevice = 1
$ShutdownDevice = 2
$DoNothing = 3

$CustomReturnCodes = @(0, 59, 1067, 13859)
$CustomReturnCodesAction = @($ShutdownDevice, $RestartDevice, $RestartShell, $RestartDevice)
$DefaultAction = $DoNothing
$CustomUserSID = Get-UsernameSID(“hogehoge")
$CustomShellPath = “C:\Programs\ShellLauncherTester\bin\Release\ShellLauncherTester.exe”
#Reset Shell Launcher
$ShellLauncherClass.RemoveCustomShell($AdminsSID)
$ShellLauncherClass.RemoveCustomShell($CustomUserSID)
$ShellLauncherClass.SetEnabled($FALSE)
#Configure Shell Launcher
$ShellLauncherClass.SetDefaultShell("explorer.exe", $RestartShell)
$ShellLauncherClass.SetCustomShell($CustomUserSID, $CustomShellPath,  $CustomReturnCodes,  $CustomReturnCodesAction, $DefaultAction)
$ShellLauncherClass.SetCustomShell($AdminsSID, "explorer.exe")
$ShellLauncherClass.SetEnabled($TRUE)