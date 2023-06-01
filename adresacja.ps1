# Tablica z 20 adresami IP
$ip_array = @(
    "192.168.129.10",
    "192.168.129.11",
    "192.168.129.12",
    "192.168.129.13",
    "192.168.129.14",
    "192.168.129.15",
    "192.168.129.16",
    "192.168.129.17",
    "192.168.129.18",
    "192.168.129.19",
    "192.168.129.20",
    "192.168.129.21",
    "192.168.129.22",
    "192.168.129.23",
    "192.168.129.24",
    "192.168.129.25",
    "192.168.129.26",
    "192.168.129.27",
    "192.168.129.28",
    "192.168.129.29"
)

# Wyświetlanie dostępnych adresów IP
Write-Host "Dostępne adresy IP:"
for ($i = 0; $i -lt $ip_array.Length; $i++) {
    Write-Host "$($i + 1). $($ip_array[$i])"
}

# Wybór adresu IP
$ip_index = Read-Host "Wybierz numer adresu IP:"

# Sprawdzenie poprawności wybranego indeksu
if ($ip_index -lt 1 -or $ip_index -gt $ip_array.Length) {
    Write-Host "Błędny numer adresu IP. Spróbuj ponownie."
    exit
}

# Pobranie wybranego adresu IP
$selected_ip = $ip_array[$ip_index - 1]

# Ustawianie nowego adresu IP
$interfaceName = "Ethernet"

$cmd = "netsh interface ip set address name='$interfaceName' static $selected_ip 255.255.255.0"
Invoke-Expression -Command $cmd

Write-Host "Adres IP został zmieniony na: $selected_ip z maską 255.255.255.0."
