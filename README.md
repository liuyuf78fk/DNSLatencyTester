# DNSLatencyTester

DNSLatencyTester is a PowerShell-based tool to measure DNS query latency and retrieve resolved IP addresses across multiple public DNS servers globally.

## Features

- Batch test latency of 10+ popular public DNS servers (IPv4 & IPv6)
- Output query time in milliseconds along with resolved IP addresses (A and AAAA records)
- Interactive prompt to test different domains repeatedly
- Supports quitting or switching domains without restarting the script
- Includes Windows batch scripts to launch PowerShell scripts easily

## Included Files

- `dns_latency_test.ps1` — Main PowerShell script to test DNS latency and get IPs
- `run_dns_test.bat` — Batch launcher for `dns_latency_test.ps1`
- `dns_latency_test_resip.ps1` — Variant script focusing on resolved IPs output
- `run_dns_test_resip.bat` — Batch launcher for `dns_latency_test_resip.ps1`

## Usage

1. Run the batch script `run_dns_test.bat` to start the latency test.
2. Enter the domain name you want to test.
3. View latency and IP addresses for each DNS server.
4. Follow on-screen instructions to test again, change domain, or quit.

## Requirements

- Windows PowerShell (version 5.1 or later recommended)
- Internet connection

## License

MIT License

---

## Author

Liu Yu <f78fk@live.com>
