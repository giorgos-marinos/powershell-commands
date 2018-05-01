$ext = ".chm"

$maps = @( ($ext, ""), (".", " "))
foreach( $map in $maps) {
    $line =  "from: " + $map[0] + "   to:" + $map[1]
    Write-Output $line
}
$filter  = "*" + $ext 
Get-ChildItem "D:\oldDisk2\books" -Filter $filter | 
Foreach-Object {
    $name = $_.Name
    foreach( $map in $maps) {

        while ($name.Contains($map[0]) ) {
            $name = $name.Replace($map[0], $map[1])
        }
    }

    $name = $name + $ext
    Write-Output $name
    Rename-Item -Path $_.FullName -NewName $name
}