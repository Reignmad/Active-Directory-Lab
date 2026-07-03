# Import the Active Directory module
Import-Module ActiveDirectory

# Get all enabled users EXCEPT Administrator and Guest
$Users = Get-ADUser -Filter {Enabled -eq $true} | Where-Object { 
    $_.SamAccountName -ne "Administrator" -and 
    $_.SamAccountName -ne "Guest" 
}

# Create the secure password
$SecurePassword = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

# Show how many users will be updated
Write-Host "Found $($Users.Count) users to update." -ForegroundColor Yellow

# Counter for tracking
$count = 0

foreach ($User in $Users) {
    try {
        # Reset the password
        Set-ADAccountPassword -Identity $User.SamAccountName -NewPassword $SecurePassword -Reset -ErrorAction Stop
        
        # Ensure they DON'T have to change it at next logon
        Set-ADUser -Identity $User.SamAccountName -ChangePasswordAtLogon $false -ErrorAction Stop
        
        $count++
        
        # Show progress every 50 users
        if ($count % 50 -eq 0) {
            Write-Host "Updated $count users..." -ForegroundColor Cyan
        }
    }
    catch {
        # If one user fails (e.g., disabled or already deleted), just skip and continue
        Write-Host "Failed for $($User.SamAccountName): Skipping..." -ForegroundColor Red
    }
}

Write-Host "Finished! Successfully updated $count out of $($Users.Count) users." -ForegroundColor Green