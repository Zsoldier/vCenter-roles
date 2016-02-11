﻿<#
.Synopsis
   Create a vCenter role for vCenter Infrastructure Navigator
.DESCRIPTION
   Create a vCenter role for vCenter Infrastructure Navigator using the minimum permissions required
.EXAMPLE
   New-InfrastructureNavigatorRole
.EXAMPLE
   New-InfrastructureNavigatorRole 'VIN-Access'
.INPUTS
   $InfrastructureNavigator_Role (string)
#>
function New-InfrastructureNavigatorRole
{
    Param
    (
        # The name of the role for the vCenter Infrastructure Navigator user
        [String]
        $InfrastructureNavigator_Role = 'InfrastructureNavigator-Access'
    )

    Begin
    {
    }
    Process
    {
        New-VIRole $InfrastructureNavigator_Role
        Set-VIRole $InfrastructureNavigator_Role -AddPrivilege (Get-VIPrivilege -id VirtualMachine.Interact.ConsoleInteract)                                                        
        Set-VIRole $InfrastructureNavigator_Role -AddPrivilege (Get-VIPrivilege -id VirtualMachine.Interact.GuestControl)
        Set-VIRole $InfrastructureNavigator_Role -AddPrivilege (Get-VIPrivilege -id VirtualMachine.Interact)

        Get-VIRole $InfrastructureNavigator_Role | Select Name,PrivilegeList
    }
    End
    {
    }
}
