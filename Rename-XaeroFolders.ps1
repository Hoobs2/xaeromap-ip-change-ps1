<#
Davey
2024/01/04
#>

#Specifyed the known part of the file name.
$partialFileName = "Multiplayer_"

#Define folder paths
$folderPaths = @("$env:USERPROFILE\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWaypoints\", "$env:USERPROFILE\curseforge\minecraft\Instances\Prodigium Reforged\XaeroWorldMap\")

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