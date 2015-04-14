Set-StrictMode -Version Latest
<#
    .SYNOPSIS
        Displays all type accelerators in the session.

    .DESCRIPTION
        Get-TypeAccelerator displays all type accelerators in the session.
        The displayed type accelerators can be filtered with a wildcard.

    .PARAMETER Name
        Filters for accelerators with a specific name.
        Wildcards are permitted.

    .PARAMETER TypeName
        Filters for accelerators of a specific type name.
        Wildcards are permitted.
#>
Function Get-TypeAccelerator {
    [CmdletBinding()]
    Param (
        [string]$Name = "*",
        [string]$TypeName = "*"
    )
    $accTypeName = 'System.Management.Automation.TypeAccelerators'
    $accType = [psobject].Assembly.GetType($accTypeName, $true, $true)
    $accelerators = $accType::Get
    foreach ($acceleratorName in $accelerators.Keys) {
        $acceleratorType = $accelerators[$acceleratorName]
        $matchesName = $acceleratorName -like $Name
        $matchesTypeName = $acceleratorType.FullName -like $TypeName
        if ($matchesName -and $matchesTypeName) {
            [pscustomobject] @{
                Name = $acceleratorName
                Type = $acceleratorType
             }
        }
    }
}
