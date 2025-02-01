###############################################################################

<#
.SYNOPSIS
Searches for lyrics of a track

.DESCRIPTION
Searches for lyrics of a track

.PARAMETER TrackId
Optional: Spotify id of track to lookup lyrics for

.PARAMETER Queries
Optional: A query to find a track to lookup lyrics for
#>
function Get-SpotifyLyrics {

    [CmdLetBinding(DefaultParameterSetName = "")]
    [Alias("lyrics")]
    param(
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName,
            ParameterSetName = ""
        )]
        [string] $TrackId = $null,

        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string[]] $Queries = $null
    )

    begin {

        if ($null -ne $Queries) {


        }

        if ($null -ne $Queries) {

            $results = Search-Spotify -SearchType Track -Queries $Queries
            $new = [System.Collections.Generic.List[string]]::new();

            foreach ($track in $results.Tracks.Items) {

                $new.Add("$($track.Artists[0].Name) - $($track.Name)")
            }

            $Queries = $new;
            if ($new.Count -eq 0) {

                Write-Warning "Nothing found"
            }
        }
        else {

            if ([String]::IsNullOrWhiteSpace($TrackId) -eq $false) {

                $track = Get-SpotifyTrackById -TrackId $TrackId

                if ($null -ne $track) {

                    $Queries = @("$($track.Artists[0].Name) - $($track.Name)");
                }
            }
            else {

                $current = Get-SpotifyCurrentlyPlaying

                if ($null -ne $current) {

                    $Queries = @("$($current.Item.Artists[0].Name) - $($current.Item.Name)");
                }
            }
        }

        if ($null -eq $Queries) {

            throw "Currently no song playing, please specify search phrase"
        }
    }

    process {

        foreach ($query in $Queries) {

            $q = [Uri]::EscapeUriString($query)
            [string] $html = "";
            try {

                $html = Invoke-WebRequest -Uri "https://www.musixmatch.com/search/$q" -ErrorAction SilentlyContinue

            }
            catch {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }
            [int] $idx = $html.IndexOf("Best Result");

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx = $html.IndexOf('<a class="title" href="', $idx);

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx += '<a class="title" href="'.Length;

            [int] $idx2 = $html.IndexOf('"', $idx);

            if ($idx2 -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $url = "https://www.musixmatch.com$($html.Substring($idx, $idx2-$idx))"

            try {
                $html = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue
            }
            catch {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx = $html.IndexOf('"body":"')

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx += '"body":"'.Length;

            $idx2 = $html.IndexOf('","language":', $idx);

            if ($idx2 -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $result = "`"$($html.Substring($idx, $idx2-$idx))`"" | ConvertFrom-Json;

            if ([String]::IsNullOrWhiteSpace($result)) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"1
            }

            $result.Replace("???", "'");
        }
    }
}
