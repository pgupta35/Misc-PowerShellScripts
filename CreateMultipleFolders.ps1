Param(
  [Parameter(Mandatory=$true)]
  $directory,
  $parentPath,
  $childPath
)

$childPath = $childPath.Split(" ")

$testIfDirectoryExists = test-path -path $directory
	if($testIfDirectoryExists -eq $false){
	$makeNewYearDir = New-Item -Type directory "$directory\$parentPath"
	}
	foreach($children in $childPath){
		$testIfChildExists = test-path -path "$directory\$parentPath\$children"
		if($testIfChildExists-eq $false){
		$makeNewChildDir =  New-Item -Type directory "$directory\$parentPath\$children"
		Write-Progress -Activity "Creating Folders" -CurrentOperation "Current Folder: $children"
		start-sleep -seconds .65
		}
	}



#Do stuff below with $finalDirectory
