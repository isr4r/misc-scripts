# PowerShell script to get other objects rights on a given user. You need PowerView module for this to work.
# Usage: .\get-rights-on-user.ps1 -SamAccountName "user1" -Rights "GenericAll"
# Output of above command: 
# Object Name: dcorp\Domain Admins, SID: S-1-5-21-719815819-3726368948-3917688648-512, Rights on user1 : GenericAll
# Object Name: dcorp\RDPUsers, SID: S-1-5-21-719815819-3726368948-3917688648-1123, Rights on user1 : GenericAll
# Object Name: BUILTIN\Account Operators, SID: S-1-5-32-548, Rights on user1 : GenericAll
# Object Name: Local System, SID: S-1-5-18, Rights on user1 : GenericAll
# Object Name: mcorp\Enterprise Admins, SID: S-1-5-21-335606122-960912869-3279953914-519, Rights on user1 : GenericAll

param (
    [string]$SamAccountName,
    [string]$Rights
)

# Get the ACL information for the specified user
$aclInfo = Get-DomainObjectACL -SamAccountName $SamAccountName -ResolveGUIDs | Select-Object SecurityIdentifier, ActiveDirectoryRights

# Loop through each ACL entry and convert SID to name for the specified rights
foreach ($entry in $aclInfo) {
    $sid = $entry.SecurityIdentifier
    $aclRights = $entry.ActiveDirectoryRights

    # Check if the ACL entry has the specified rights
    if ($aclRights -eq $Rights) {
        # Convert SID to name
        $object = Convert-SidToName -Sid $sid

        # Output the results
        Write-Output "Object Name: $object, SID: $sid, Rights on $SamAccountName : $Rights"
    }
}
