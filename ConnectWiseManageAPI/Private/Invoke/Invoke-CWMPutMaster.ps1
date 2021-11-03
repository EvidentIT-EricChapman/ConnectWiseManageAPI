function Invoke-CWMPutMaster {
    <# Not working attempt at doing the PUT for Sales activities which dont seem to work properly.
    #>
    [CmdletBinding()]
    param (
        $Object,
        [string]$URI

    )
    Write-Verbose $Object
    #Write-Verbose $Arguments.Value
    #$global:TArguments = $Arguments

    $Body = $Object
    <#
    $Body =@(
        @{            
            op = $Arguments.Operation
            path = $Arguments.Path
            value = $Arguments.Value
        }
    )
    #>
    $Body = $(ConvertTo-Json -inputobject $Body -depth 8 )
    Write-Verbose $Body

    $WebRequestArguments = @{
        Uri = $URI
        Method = 'Put'
        ContentType = 'application/json'
        Body = $Body
    }
    $Result = Invoke-CWMWebRequest -Arguments $WebRequestArguments
    if($Result.content){
        $Result = $Result.content | ConvertFrom-Json
    }
    return $Result
}
