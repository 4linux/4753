On Error Resume Next
set objNetwork= CreateObject("WScript.Network")
objNetwork.MapNetworkDrive "P:", "\\samba4-server\publico" 
objNetwork.MapNetworkDrive "L:", "\\samba4-server\lixeiras"
strDom = objNetwork.UserDomain
strUser = objNetwork.UserName
Set objUser = GetObject("WinNT://" & strDom & "/" & strUser &  ",user")
