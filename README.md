# YamadaX Toolkit

WPF GUI สำหรับ setup PC แบบคลิกเดียว รวม 3 tools:

- **Install** — ติดตั้งโปรแกรมผ่าน winget + FiveM setup
- **Timer Resolution** — ติดตั้ง 0.5ms Scheduled Task
- **MSI Utility v3** — Download & Run MSI Utility

## วิธีใช้

### Option A — one-liner (หลัง host บน GitHub)
```powershell
irm https://raw.githubusercontent.com/YamadaX9999/YamadaX-Toolkit/main/run.ps1 | iex
```

### Option B — รันไฟล์โดยตรง
```powershell
# Run as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force
.\run.ps1
```

## Requirements
- Windows 10/11
- Run as Administrator
- PowerShell 5.1+
- winget (สำหรับ Install tab)

## Sources
- https://github.com/YamadaX9999/timer-resoulution-0.5-ms
- https://github.com/YamadaX9999/setuppc
- https://github.com/Sathango/Msi-Utility-v3
