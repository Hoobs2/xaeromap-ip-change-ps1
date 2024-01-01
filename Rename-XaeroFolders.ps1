
#C:\Users\Davey\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWaypoints\Multiplayer_*

#C:\Users\Davey\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWorldMap\Multiplayer_*

[String]$NewIP = Read-Host "Please Enter IP "

#Rename Waypoints folder with entered IP.
Get-ChildItem -Path $env:USERPROFILE"\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWaypoints\" -Directory -Filter "Multiplayer_*" | Rename-Item -NewName "Multiplayer_$NewIP"

#Rename Map data folder with entered IP.
Get-ChildItem -Path $env:USERPROFILE"\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWorldMap\" -Directory -Filter "Multiplayer_*" | Rename-Item -NewName "Multiplayer_$NewIP"