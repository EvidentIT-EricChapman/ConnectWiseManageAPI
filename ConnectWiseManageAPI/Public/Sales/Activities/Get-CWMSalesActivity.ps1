﻿function Get-CWMSalesActivity {
    [CmdletBinding()]
    param(
        [int]$id,
        [switch]$count,
        [string]$condition,
        [ValidatePattern('\S* (desc|asc)')]
        [string]$orderBy,
        [string]$childConditions,
        [string]$customFieldConditions,
        [int]$page,
        [int]$pageSize,
        [string[]]$fields,
        [switch]$all
    )

    $Endpoint = '/sales/activities'
    Invoke-CWMGetMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
 }
