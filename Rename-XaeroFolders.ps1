<#
Davey
2024/01/04
#>

#Specifyed the known part of the file name.
$partialFileName = "Multiplayer_"

#Specified Default Path
$defaultPath1 = "$env:USERPROFILE\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWaypoints\"
$defaultPath2 = "$env:USERPROFILE\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWorldMap\"

$WaypointPath1
$MapDataPath2

#Define folder paths
$folderPaths = @()

#Test Folder Path and prompt for new path if not found
if (!(Test-Path $defaultPath1)) {
    $WaypointPath1 = Read-Host "Default Waypoint path not found. Please enter a custom Waypoint path, (Press Enter to finish):"
    $MapDataPath2 = Read-Host "Default Map Data path not found. Please enter a custom Map data path (Press Enter to finish):"

    $folderPaths += $WaypointPath1
    $folderPaths += $MapDataPath2
}
else {
    $folderPaths += $defaultPath1
    $folderPaths += $defaultPath2
}

#Prompt for new IP.
[String]$NewIP = Read-Host "Please Enter IP "

#Find matching files in each directory.
foreach ($path in $folderPaths) {

    #Rename folder with entered IP.
    Get-ChildItem -Path $path -Directory -Filter "$partialFileName*" | Rename-Item -NewName "Multiplayer_$NewIP"

    $matchingFolder = Get-ChildItem -Path $path -Directory -Filter "$partialFileName*" -ErrorAction SilentlyContinue | Select-Object -First 1 -ErrorAction SilentlyContinue

    if ($matchingFolder) {
        #Output the name of the first matching file in the directory. Can just be the first item because in order for the script to work there can be only one folder in the directory.
        Write-Host ("Matching file name in {0}: {1}" -f $path, $matchingFolder.Name)
    } else {
        Write-Host "No files matching '$partialFileName' found in $path."
    }
}

Read-Host -Prompt "Press Enter to exit"