#Get a list of all folders under "D:\Users"
Get-ChildItem -Path "D:\Users" -Name | foreach {
    #If the current folder has a "Scans" directory...
    if(test-path -path D:\Users\$_\Scans) {
        #Search all files within the "Scans" directory that are older than 30 days
        forfiles -p "D:\Users\$($_)\Scans" -s -m *.* -d -30 -c "cmd /c echo @file is at least 30 days old. @PATH"
    }
}