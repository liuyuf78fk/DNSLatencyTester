# DNS Latency Test Script for a Given Domain Using Multiple Global Public DNS Servers
# Author: Liu Yu <f78fk@live.com>
# Date: 2025-05-31
# Description: Measures the DNS resolution latency for a given domain using over 30 global public DNS resolvers.

# Prompt the user for the domain name to test
$domain = Read-Host "Enter the domain to test (e.g., jpliuyu.duckdns.org)"

# Define a list of public DNS servers (Name + IP)
$dnsServers = @(
    @{Name="Google 1";        IP="8.8.8.8"},
    @{Name="Google 2";        IP="8.8.4.4"},
    @{Name="Cloudflare 1";    IP="1.1.1.1"},
    @{Name="Cloudflare 2";    IP="1.0.0.1"},
    @{Name="OpenDNS 1";       IP="208.67.222.222"},
    @{Name="OpenDNS 2";       IP="208.67.220.220"},
    @{Name="Quad9 1";         IP="9.9.9.9"},
    @{Name="Quad9 2";         IP="149.112.112.112"},
    @{Name="Level3 1";        IP="4.2.2.1"},
    @{Name="Level3 2";        IP="4.2.2.2"},
    @{Name="Comodo";          IP="8.26.56.26"},
    @{Name="Neustar";         IP="156.154.70.1"},
    @{Name="Verisign";        IP="64.6.64.6"},
    @{Name="AliDNS 1";        IP="223.5.5.5"},
    @{Name="AliDNS 2";        IP="223.6.6.6"},
    @{Name="114DNS 1";        IP="114.114.114.114"},
    @{Name="114DNS 2";        IP="114.114.115.115"},
    @{Name="DNSPod 1";        IP="119.29.29.29"},
    @{Name="DNSPod 2";        IP="182.254.116.116"},
    @{Name="360DNS";          IP="101.226.4.6"},
    @{Name="CNNIC 1";         IP="1.2.4.8"},
    @{Name="CNNIC 2";         IP="210.2.4.8"},
    @{Name="Dnspai 1";        IP="101.226.4.6"},
    @{Name="Dnspai 2";        IP="218.30.118.6"},
    @{Name="Baidu";           IP="180.76.76.76"},
    @{Name="Yandex DNS";      IP="77.88.8.8"},
    @{Name="CleanBrowsing";   IP="185.228.168.9"},
    @{Name="SafeDNS";         IP="195.46.39.39"},
    @{Name="AdGuard 1";       IP="94.140.14.14"},
    @{Name="AdGuard 2";       IP="94.140.15.15"},
    @{Name="NTT DNS";         IP="129.250.35.250"},
    @{Name="Korea KT";        IP="168.126.63.1"},
    @{Name="Taiwan Hinet";    IP="168.95.1.1"}
)

while ($true) {
    if (-not $domain) {
        $domain = Read-Host "Enter the domain to test (e.g., jpliuyu.duckdns.org)"
    }

    Write-Host "`n=== Starting DNS latency test for: $domain ===`n"

    foreach ($dns in $dnsServers) {
        Write-Host "Testing DNS: $($dns.Name) ($($dns.IP)) ..." -NoNewline
        try {
            $result = Measure-Command {
                Resolve-DnsName -Name $domain -Server $dns.IP -ErrorAction Stop | Out-Null
            }
            $ms = [math]::Round($result.TotalMilliseconds, 2)
            Write-Host " $ms ms" -ForegroundColor Green
        }
        catch {
            Write-Host " Failed" -ForegroundColor Red
        }
    }

    # Ask user for next action
    $input = Read-Host "`nPress Enter to test again, type 'r' to test a different domain, or type 'q' or 'exit' to quit"
    if ($input -match '^(q|exit)$') {
        Write-Host "Exiting..."
        break
    } elseif ($input -match '^r$') {
        $domain = $null
    }
    # If Enter, do nothing – just repeat with current domain
}
