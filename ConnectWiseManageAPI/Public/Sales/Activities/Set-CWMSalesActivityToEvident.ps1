function Set-CWMSalesActivitytoEvident {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $ID,
        [Parameter(Mandatory=$false)]
        $Object
    )

    $company = [PSCustomObject]@{
        id = '250'
        identifier = 'EvidentIT'
        name = 'Evident IT Inc.'
    }

    $contact = [PSCustomObject]@{
        id = '10'
        name = 'Roger Miranda'
    }

    $scheduleStatus = [PSCustomObject]@{
        id = '2'
        name = 'Firm'
    }

    $PhoneNumber = '2042282032'

    $Object = Get-CWMSalesActivity -Condition "id = $ID" | where-object { -not $_.company } | Select-Object *, @{n="company"; e={$company}}, @{n="contact"; e={$contact}} #, @{n="scheduleStatus"; e={$scheduleStatus}}

    $Object.scheduleStatus = $scheduleStatus
    
    $URI = "https://$($global:CWMServerConnection.Server)/v4_6_release/apis/3.0/sales/activities/$ID"
    return Invoke-CWMPutMaster -Object $Object -URI $URI

}
