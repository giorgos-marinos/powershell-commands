$list = (docker ps -a).split([environment]::NewLine)

if( $list.Length -gt 1 ){
    $list = $list[1.. ($list.Length-1) ]
    foreach ($line in $list) { 
        while ($line.Contains("  ") ) {
            $line = $line.Replace("  ", " ")
        }
        $words = $line.Split(" ")
        $container = $words[ $words.Length-1 ]

        Write-Output $container
        docker rm $container
    }
}