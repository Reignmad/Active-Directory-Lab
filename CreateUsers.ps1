# Import the Active Directory Module
Import-Module ActiveDirectory

# Arrays for random generation
$FirstNames = @("James","Mary","John","Patricia","Robert","Jennifer","Michael","Linda","William","Elizabeth","David","Barbara","Richard","Susan","Joseph","Jessica","Thomas","Sarah","Charles","Karen","Daniel","Nancy","Matthew","Lisa","Anthony","Betty","Mark","Helen","Donald","Sandra","Paul","Ruth","Steven","Sharon","Andrew","Michelle","Kenneth","Laura","Joshua","Kimberly","Kevin","Deborah","Brian","Amanda","George","Melissa","Timothy","Stephanie","Ronald","Dorothy","Jason","Rebecca","Edward","Shirley","Jeffrey","Amy","Ryan","Angela","Jacob","Anna","Gary","Ruth","Nicholas","Brenda","Eric","Pamela","Jonathan","Nicole","Stephen","Katherine","Larry","Samantha","Justin","Christine","Scott","Emma","Brandon","Catherine","Benjamin","Carol","Samuel","Janet","Raymond","Virginia","Gregory","Jane","Frank","Lori","Patrick","Rachel","Jack","Heather","Dennis","Diane","Jerry","Ashley","Tyler","Julie","Aaron","Megan","Jose","Joan","Nathan","Kelly","Adam","Christina")
$LastNames = @("Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez","Hernandez","Lopez","Wilson","Anderson","Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White","Harris","Sanchez","Clark","Ramirez","Lewis","Robinson","Walker","Young","Allen","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Morris","Murphy","Cook","Rogers","Morgan","Peterson","Cooper","Reed","Bailey","Bell","Howard","Ward","Cox","Diaz","Richardson","Wood","Watson","Brooks","Bennett","Gray","James","Reyes","Cruz","Hughes","Price","Myers","Long","Foster","Sanders","Ross","Powell","Sullivan","Russell","Ortiz","Jenkins","Perry","Butler","Barnes","Fisher","Henderson","Coleman","Simmons","Patterson","Jordan","Reynolds","Hamilton","Graham","Kim","Gonzales")
$JobTitles = @("Manager","Specialist","Analyst","Consultant","Coordinator","Administrator","Engineer","Assistant","Technician","Supervisor","Director","Associate","Executive","Developer","Architect")
$OUs = @("IT","HR","Finance","Sales","Marketing","Operations")

Write-Host "Starting creation of 1,000 users on oabusa.local..." -ForegroundColor Green

# Loop to create 1,000 users
for ($i=1; $i -le 1000; $i++) {

    # Randomly generate user details
    $FirstName = $FirstNames | Get-Random
    $LastName = $LastNames | Get-Random
    $JobTitle = $JobTitles | Get-Random
    $Department = $OUs | Get-Random
    
    # Create a unique username (First initial + Last name + 4-digit number)
    $Username = "$($FirstName.Substring(0,1))$LastName" + (Get-Random -Min 1000 -Max 9999)
    $DisplayName = "$FirstName $LastName"
    
    # Set default password
    $Password = "P@ssw0rd123!"
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    
    # Define the exact OU path (e.g., OU=IT,DC=oabusa,DC=local)
    $OUDN = "OU=$Department,DC=oabusa,DC=local"

    try {
        New-ADUser -Name $DisplayName `
                   -GivenName $FirstName `
                   -Surname $LastName `
                   -SamAccountName $Username `
                   -UserPrincipalName "$Username@oabusa.local" `
                   -DisplayName $DisplayName `
                   -Department $Department `
                   -Title $JobTitle `
                   -Company "Khumbulekhaya Stokvel" `
                   -OfficePhone "011-555-$((Get-Random -Min 1000 -Max 9999))" `
                   -AccountPassword $SecurePassword `
                   -Enabled $true `
                   -ChangePasswordAtLogon $false `
                   -Path $OUDN `
                   -ErrorAction Stop
        
        # Progress indicator
        if ($i % 100 -eq 0) {
            Write-Host "Created $i users so far..." -ForegroundColor Cyan
        }
    }
    catch {
        # Silently skip duplicates/errors to avoid clutter
    }
}

Write-Host "Finished! All 1,000 users have been created." -ForegroundColor Green