function Invoke-CatFact {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
        [Parameter(ParameterSetName = 'Male')]
        [switch] $Male,

        [Parameter(ParameterSetName = 'Female')]
        [switch] $Female,

        [string] $Text = "Fetching a cat fact..."
    )

    try {
        # Choose voice
        $voiceIndex = if ($Female) { 1 } else { 0 }

        # Speak the provided text first
        $speaker = New-Object -ComObject SAPI.SPVoice
        $speaker.Voice = $speaker.GetVoices().Item($voiceIndex)
        $speaker.Speak($Text) | Out-Null

        # Fetch and speak a cat fact
        $catFact = Invoke-RestMethod 'https://catfact.ninja/fact'
        $speaker.Speak($catFact.fact) | Out-Null
    }
    catch {
        Write-Error "Failed to speak the cat fact: $_"
    }
}
