$results = @()

for ($i=1; $i -le 30; $i++) {

    $start = Get-Date

    $event = Get-WinEvent -FilterHashtable @{
      LogName = 'Security'
      Id = 4624
    } -MaxEvents 1

    $end = Get-Date
    ($end - $start).TotalMilliseconds
}

$results | Out-File log_query_latency.csv
