#Requires -RunAsAdministrator
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# ── XAML UI ────────────────────────────────────────────────────────────────────
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="YamadaX Toolkit" Height="560" Width="740"
    WindowStartupLocation="CenterScreen" ResizeMode="CanMinimize"
    Background="#0f0f1e" FontFamily="Segoe UI" FontSize="13">

  <Window.Resources>
    <!-- Tab style -->
    <Style TargetType="TabItem">
      <Setter Property="Background" Value="#0f0f1e"/>
      <Setter Property="Foreground" Value="#888"/>
      <Setter Property="BorderBrush" Value="Transparent"/>
      <Setter Property="Padding" Value="18,8"/>
      <Setter Property="FontSize" Value="12"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="TabItem">
            <Border Name="Border" Background="{TemplateBinding Background}"
                    BorderBrush="Transparent" BorderThickness="0,0,0,2" Padding="18,8">
              <ContentPresenter ContentSource="Header" TextBlock.Foreground="{TemplateBinding Foreground}"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsSelected" Value="True">
                <Setter TargetName="Border" Property="Background" Value="#1a1a2e"/>
                <Setter TargetName="Border" Property="BorderBrush" Value="#7c6af0"/>
                <Setter Property="Foreground" Value="#9d8df0"/>
              </Trigger>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Border" Property="Background" Value="#1a1a2e"/>
                <Setter Property="Foreground" Value="#ccc"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- CheckBox style -->
    <Style TargetType="CheckBox">
      <Setter Property="Foreground" Value="#b0b0cc"/>
      <Setter Property="Margin" Value="0,3,0,3"/>
      <Setter Property="VerticalContentAlignment" Value="Center"/>
    </Style>

    <!-- Primary button -->
    <Style x:Key="PrimaryBtn" TargetType="Button">
      <Setter Property="Background" Value="#4a35c0"/>
      <Setter Property="Foreground" Value="White"/>
      <Setter Property="BorderBrush" Value="#7c6af0"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="Padding" Value="0,7"/>
      <Setter Property="FontSize" Value="12"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border Background="{TemplateBinding Background}"
                    BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}"
                    CornerRadius="5" Padding="{TemplateBinding Padding}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="#5a45d0"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter Property="Background" Value="#3a25b0"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Secondary button -->
    <Style x:Key="SecBtn" TargetType="Button">
      <Setter Property="Background" Value="#1e1e38"/>
      <Setter Property="Foreground" Value="#c0c0e0"/>
      <Setter Property="BorderBrush" Value="#3a3a5a"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="Padding" Value="0,7"/>
      <Setter Property="FontSize" Value="12"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border Background="{TemplateBinding Background}"
                    BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}"
                    CornerRadius="5" Padding="{TemplateBinding Padding}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="#2a2a4a"/>
                <Setter Property="BorderBrush" Value="#7c6af0"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter Property="Background" Value="#111125"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Section label -->
    <Style x:Key="SectionLabel" TargetType="TextBlock">
      <Setter Property="Foreground" Value="#7c6af0"/>
      <Setter Property="FontSize" Value="11"/>
      <Setter Property="FontWeight" Value="SemiBold"/>
      <Setter Property="Margin" Value="0,12,0,5"/>
    </Style>

    <!-- Log box -->
    <Style x:Key="LogBox" TargetType="TextBox">
      <Setter Property="Background" Value="#0a0a18"/>
      <Setter Property="Foreground" Value="#7fc47f"/>
      <Setter Property="FontFamily" Value="Consolas"/>
      <Setter Property="FontSize" Value="11"/>
      <Setter Property="BorderBrush" Value="#2a2a4a"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="IsReadOnly" Value="True"/>
      <Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
      <Setter Property="TextWrapping" Value="Wrap"/>
      <Setter Property="Padding" Value="8"/>
    </Style>
  </Window.Resources>

  <DockPanel>

    <!-- Title bar -->
    <Border DockPanel.Dock="Top" Background="#0a0a18" BorderBrush="#2a2a4a" BorderThickness="0,0,0,1" Padding="14,8">
      <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
        <Border Width="22" Height="22" CornerRadius="5" Margin="0,0,10,0">
          <Border.Background>
            <LinearGradientBrush StartPoint="0,0" EndPoint="1,1">
              <GradientStop Color="#7c6af0" Offset="0"/>
              <GradientStop Color="#4a90d9" Offset="1"/>
            </LinearGradientBrush>
          </Border.Background>
          <TextBlock Text="X" Foreground="White" FontWeight="Bold" FontSize="11"
                     HorizontalAlignment="Center" VerticalAlignment="Center"/>
        </Border>
        <TextBlock Text="YamadaX Toolkit" Foreground="#c0c0e0" FontSize="13" FontWeight="SemiBold" VerticalAlignment="Center"/>
        <TextBlock Text="  ·  Run as Administrator" Foreground="#444" FontSize="11" VerticalAlignment="Center"/>
      </StackPanel>
    </Border>

    <!-- Status bar -->
    <Border DockPanel.Dock="Bottom" Background="#0a0a18" BorderBrush="#2a2a4a" BorderThickness="0,1,0,0" Padding="14,5">
      <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
        <Ellipse Width="7" Height="7" Fill="#4a9d4a" Margin="0,0,7,0"/>
        <TextBlock Name="StatusText" Text="Ready" Foreground="#666" FontSize="11"/>
      </StackPanel>
    </Border>

    <!-- Tabs -->
    <TabControl Background="#1a1a2e" BorderBrush="#2a2a4a" BorderThickness="0">

      <!-- ══════════════════════════════════════════════════════
           TAB 1 : INSTALL
      ══════════════════════════════════════════════════════ -->
      <TabItem Header="Install">
        <DockPanel>

          <!-- Action bar -->
          <Border DockPanel.Dock="Top" Background="#111125" BorderBrush="#2a2a4a" BorderThickness="0,1,0,1" Padding="12,8">
            <Grid>
              <Grid.ColumnDefinitions>
                <ColumnDefinition/><ColumnDefinition/><ColumnDefinition/>
              </Grid.ColumnDefinitions>
              <Button Grid.Column="0" Name="BtnInstall" Content="Install Selected" Style="{StaticResource PrimaryBtn}" Margin="0,0,6,0"/>
              <Button Grid.Column="1" Name="BtnSelectAll" Content="Select All" Style="{StaticResource SecBtn}" Margin="0,0,6,0"/>
              <Button Grid.Column="2" Name="BtnClearAll" Content="Clear All" Style="{StaticResource SecBtn}"/>
            </Grid>
          </Border>

          <!-- Log panel -->
          <Border DockPanel.Dock="Bottom" Height="130" BorderBrush="#2a2a4a" BorderThickness="0,1,0,0">
            <TextBox Name="InstallLog" Style="{StaticResource LogBox}" Text="[Log] Ready — select programs and click Install Selected"/>
          </Border>

          <!-- Program list -->
          <ScrollViewer VerticalScrollBarVisibility="Auto" Background="#1a1a2e">
            <Grid Margin="16,8">
              <Grid.ColumnDefinitions>
                <ColumnDefinition/><ColumnDefinition/>
              </Grid.ColumnDefinitions>

              <!-- Left column -->
              <StackPanel Grid.Column="0" Margin="0,0,16,0">
                <TextBlock Text="GAMING" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="ChkFiveM"    Content="FiveM  (+ import settings)" IsChecked="True"/>
                <CheckBox Name="ChkSteam"    Content="Steam" IsChecked="True"/>
                <CheckBox Name="ChkRockstar" Content="Rockstar Games Launcher" IsChecked="True"/>

                <TextBlock Text="COMMUNICATION" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="ChkDiscord" Content="Discord" IsChecked="True"/>

                <TextBlock Text="AUDIO / VIDEO" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="ChkFXSound"    Content="FXSound" IsChecked="True"/>
                <CheckBox Name="ChkLosslessCut" Content="LosslessCut"/>
              </StackPanel>

              <!-- Right column -->
              <StackPanel Grid.Column="1">
                <TextBlock Text="DRIVERS &amp; RUNTIME" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="ChkNvidia" Content="NVIDIA Driver 610.47" IsChecked="True"/>
                <CheckBox Name="ChkDotNet" Content=".NET Runtime" IsChecked="True"/>

                <TextBlock Text="UTILITIES" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="Chk7Zip"  Content="7-Zip" IsChecked="True"/>
                <CheckBox Name="ChkRazer" Content="Razer Synapse"/>

                <TextBlock Text="SYSTEM" Style="{StaticResource SectionLabel}"/>
                <CheckBox Name="ChkActivate" Content="Activate Windows"/>
              </StackPanel>
            </Grid>
          </ScrollViewer>
        </DockPanel>
      </TabItem>

      <!-- ══════════════════════════════════════════════════════
           TAB 2 : TIMER RESOLUTION
      ══════════════════════════════════════════════════════ -->
      <TabItem Header="Timer Resolution">
        <DockPanel>

          <!-- Action bar -->
          <Border DockPanel.Dock="Top" Background="#111125" BorderBrush="#2a2a4a" BorderThickness="0,1,0,1" Padding="12,8">
            <Grid>
              <Grid.ColumnDefinitions>
                <ColumnDefinition/><ColumnDefinition/><ColumnDefinition/>
              </Grid.ColumnDefinitions>
              <Button Grid.Column="0" Name="BtnTimerInstall" Content="Install Task"   Style="{StaticResource PrimaryBtn}" Margin="0,0,6,0"/>
              <Button Grid.Column="1" Name="BtnTimerStatus"  Content="Check Status"   Style="{StaticResource SecBtn}"    Margin="0,0,6,0"/>
              <Button Grid.Column="2" Name="BtnTimerRemove"  Content="Uninstall Task" Style="{StaticResource SecBtn}"/>
            </Grid>
          </Border>

          <!-- Log -->
          <Border DockPanel.Dock="Bottom" Height="130" BorderBrush="#2a2a4a" BorderThickness="0,1,0,0">
            <TextBox Name="TimerLog" Style="{StaticResource LogBox}" Text="[Log] Ready"/>
          </Border>

          <!-- Info -->
          <ScrollViewer Background="#1a1a2e">
            <StackPanel Margin="20,16">
              <TextBlock Text="TIMER RESOLUTION 0.5ms" Style="{StaticResource SectionLabel}" Margin="0,0,0,10"/>

              <Border Background="#111125" BorderBrush="#2a2a4a" BorderThickness="1" CornerRadius="6" Padding="14,12" Margin="0,0,0,14">
                <StackPanel>
                  <TextBlock Text="How it works" Foreground="#9d8df0" FontSize="12" FontWeight="SemiBold" Margin="0,0,0,6"/>
                  <TextBlock TextWrapping="Wrap" Foreground="#888" LineHeight="20" FontSize="12">
                    <Run>Windows default timer resolution คือ 15.6ms</Run>
                    <LineBreak/>
                    <Run>Script นี้จะสร้าง Scheduled Task ที่รันใต้ SYSTEM account</Run>
                    <LineBreak/>
                    <Run>เพื่อล็อค timer ที่ 0.5ms ตั้งแต่ Boot — ไม่ต้องเปิด app ค้างไว้</Run>
                  </TextBlock>
                </StackPanel>
              </Border>

              <Border Background="#111125" BorderBrush="#2a2a4a" BorderThickness="1" CornerRadius="6" Padding="14,12">
                <StackPanel>
                  <TextBlock Text="Source" Foreground="#9d8df0" FontSize="12" FontWeight="SemiBold" Margin="0,0,0,6"/>
                  <TextBlock FontFamily="Consolas" FontSize="11" Foreground="#7c6af0" TextWrapping="Wrap">
                    github.com/YamadaX9999/timer-resoulution-0.5-ms
                  </TextBlock>
                </StackPanel>
              </Border>
            </StackPanel>
          </ScrollViewer>
        </DockPanel>
      </TabItem>

      <!-- ══════════════════════════════════════════════════════
           TAB 3 : MSI UTILITY
      ══════════════════════════════════════════════════════ -->
      <TabItem Header="MSI Utility v3">
        <DockPanel>

          <!-- Action bar -->
          <Border DockPanel.Dock="Top" Background="#111125" BorderBrush="#2a2a4a" BorderThickness="0,1,0,1" Padding="12,8">
            <Grid>
              <Grid.ColumnDefinitions>
                <ColumnDefinition/><ColumnDefinition/>
              </Grid.ColumnDefinitions>
              <Button Grid.Column="0" Name="BtnMsiRun"      Content="Download &amp; Run" Style="{StaticResource PrimaryBtn}" Margin="0,0,6,0"/>
              <Button Grid.Column="1" Name="BtnMsiOpenFolder" Content="Open Download Folder" Style="{StaticResource SecBtn}"/>
            </Grid>
          </Border>

          <!-- Log -->
          <Border DockPanel.Dock="Bottom" Height="130" BorderBrush="#2a2a4a" BorderThickness="0,1,0,0">
            <TextBox Name="MsiLog" Style="{StaticResource LogBox}" Text="[Log] Ready"/>
          </Border>

          <!-- Info -->
          <ScrollViewer Background="#1a1a2e">
            <StackPanel Margin="20,16">
              <TextBlock Text="MSI UTILITY V3" Style="{StaticResource SectionLabel}" Margin="0,0,0,10"/>

              <Border Background="#111125" BorderBrush="#2a2a4a" BorderThickness="1" CornerRadius="6" Padding="14,12" Margin="0,0,0,14">
                <StackPanel>
                  <TextBlock Text="What it does" Foreground="#9d8df0" FontSize="12" FontWeight="SemiBold" Margin="0,0,0,8"/>
                  <TextBlock TextWrapping="Wrap" Foreground="#888" LineHeight="20" FontSize="12">
                    <Run>ตั้งค่า MSI (Message Signaled Interrupts) สำหรับ:</Run>
                    <LineBreak/><Run>  · GPU  — ลด DPC latency จาก interrupt mode</Run>
                    <LineBreak/><Run>  · NIC  — ลด network interrupt overhead</Run>
                    <LineBreak/><Run>  · USB Controller</Run>
                    <LineBreak/><LineBreak/>
                    <Run>ช่วย FiveM / gaming ได้จริงโดยเฉพาะบน RTX 4070 Ti Super</Run>
                  </TextBlock>
                </StackPanel>
              </Border>

              <Border Background="#111125" BorderBrush="#2a2a4a" BorderThickness="1" CornerRadius="6" Padding="14,12">
                <StackPanel>
                  <TextBlock Text="Source" Foreground="#9d8df0" FontSize="12" FontWeight="SemiBold" Margin="0,0,0,6"/>
                  <TextBlock FontFamily="Consolas" FontSize="11" Foreground="#7c6af0" TextWrapping="Wrap">
                    github.com/Sathango/Msi-Utility-v3
                  </TextBlock>
                </StackPanel>
              </Border>
            </StackPanel>
          </ScrollViewer>
        </DockPanel>
      </TabItem>

    </TabControl>
  </DockPanel>
</Window>
"@

# ── Load UI ───────────────────────────────────────────────────────────────────
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ── Get controls ──────────────────────────────────────────────────────────────
$StatusText    = $window.FindName("StatusText")
$InstallLog    = $window.FindName("InstallLog")
$TimerLog      = $window.FindName("TimerLog")
$MsiLog        = $window.FindName("MsiLog")

# Install tab
$ChkFiveM      = $window.FindName("ChkFiveM")
$ChkSteam      = $window.FindName("ChkSteam")
$ChkRockstar   = $window.FindName("ChkRockstar")
$ChkDiscord    = $window.FindName("ChkDiscord")
$ChkFXSound    = $window.FindName("ChkFXSound")
$ChkLossless   = $window.FindName("ChkLosslessCut")
$ChkNvidia     = $window.FindName("ChkNvidia")
$ChkDotNet     = $window.FindName("ChkDotNet")
$Chk7Zip       = $window.FindName("Chk7Zip")
$ChkRazer      = $window.FindName("ChkRazer")
$ChkActivate   = $window.FindName("ChkActivate")

$BtnInstall    = $window.FindName("BtnInstall")
$BtnSelectAll  = $window.FindName("BtnSelectAll")
$BtnClearAll   = $window.FindName("BtnClearAll")

# Timer tab
$BtnTimerInstall = $window.FindName("BtnTimerInstall")
$BtnTimerStatus  = $window.FindName("BtnTimerStatus")
$BtnTimerRemove  = $window.FindName("BtnTimerRemove")

# MSI tab
$BtnMsiRun       = $window.FindName("BtnMsiRun")
$BtnMsiOpenFolder= $window.FindName("BtnMsiOpenFolder")

# ── Helper: ตรวจสอบโปรแกรมที่ติดตั้งอยู่แล้วในเครื่อง ──────────────────────────
function Get-InstalledAppNames {
    # อ่านชื่อโปรแกรมทั้งหมดจาก Uninstall registry (64-bit, 32-bit, และ per-user)
    $keys = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )
    $names = foreach ($k in $keys) {
        Get-ItemProperty $k -ErrorAction SilentlyContinue | ForEach-Object { $_.DisplayName }
    }
    $names | Where-Object { $_ }
}

function Test-AppInstalled {
    param($Names, [string[]]$Patterns, [string[]]$Paths)
    foreach ($p in $Patterns) {
        if ($Names | Where-Object { $_ -like $p }) { return $true }
    }
    foreach ($p in $Paths) {
        if ($p -and (Test-Path $p -ErrorAction SilentlyContinue)) { return $true }
    }
    return $false
}

# ── INSTALL: scan แล้วทำ checkbox ของโปรแกรมที่มีอยู่แล้วให้เป็นสีเทา/ติ๊กไม่ได้ ──
$installedNames = Get-InstalledAppNames

# แต่ละรายการ = checkbox + เงื่อนไขที่ใช้เช็คว่า "มีอยู่แล้ว"
#   Patterns = ชื่อใน Uninstall registry (รองรับ wildcard *)
#   Paths    = ไฟล์/โฟลเดอร์ที่เช็คเพิ่มเติม (เผื่อโปรแกรมไม่มี entry ใน registry)
$installCheckMap = @(
    @{ Chk = $ChkFiveM;    Patterns = @();                                                              Paths = @("$env:LOCALAPPDATA\FiveM\FiveM Application Data\FiveM.exe") }
    @{ Chk = $ChkSteam;    Patterns = @('Steam');                                                        Paths = @("${env:ProgramFiles(x86)}\Steam\steam.exe","$env:ProgramFiles\Steam\steam.exe") }
    @{ Chk = $ChkRockstar; Patterns = @('Rockstar Games Launcher*');                                     Paths = @() }
    @{ Chk = $ChkDiscord;  Patterns = @('Discord');                                                      Paths = @("$env:LOCALAPPDATA\Discord\Update.exe") }
    @{ Chk = $ChkFXSound;  Patterns = @('FxSound*','FXSound*');                                          Paths = @() }
    @{ Chk = $ChkLossless; Patterns = @('LosslessCut*');                                                 Paths = @() }
    @{ Chk = $ChkNvidia;   Patterns = @('NVIDIA Graphics Driver*','NVIDIA GeForce Experience*');         Paths = @() }
    @{ Chk = $ChkDotNet;   Patterns = @('Microsoft .NET Runtime*','Microsoft Windows Desktop Runtime*');  Paths = @("$env:ProgramFiles\dotnet\shared\Microsoft.NETCore.App") }
    @{ Chk = $Chk7Zip;     Patterns = @('7-Zip*');                                                        Paths = @("$env:ProgramFiles\7-Zip\7z.exe") }
    @{ Chk = $ChkRazer;    Patterns = @('Razer Synapse*');                                               Paths = @() }
)

foreach ($entry in $installCheckMap) {
    try {
        if (Test-AppInstalled -Names $installedNames -Patterns $entry.Patterns -Paths $entry.Paths) {
            $entry.Chk.IsChecked = $true
            $entry.Chk.IsEnabled = $false
            $entry.Chk.Content   = "$($entry.Chk.Content)  (ติดตั้งแล้ว)"
        }
    } catch { }
}

# ── Helper: log append ────────────────────────────────────────────────────────
function Write-Log($box, $msg) {
    $box.Text += "`n[$(Get-Date -Format 'HH:mm:ss')] $msg"
    $box.ScrollToEnd()
}

function Set-Status($msg) { $StatusText.Text = $msg }

# ── Helper: run script in background ─────────────────────────────────────────
function Run-ScriptAsync($url, $logBox, $label) {
    Write-Log $logBox "Starting: $label"
    Set-Status "Running: $label..."
    $job = Start-Job -ScriptBlock {
        param($u)
        try {
            $s = (Invoke-RestMethod $u -UseBasicParsing)
            Invoke-Expression $s
            "DONE"
        } catch { "ERROR: $_" }
    } -ArgumentList $url

    # Poll job (non-blocking via DispatcherTimer)
    $timer = New-Object System.Windows.Threading.DispatcherTimer
    $timer.Interval = [TimeSpan]::FromSeconds(1)
    $timer.Add_Tick({
        if ($job.State -in 'Completed','Failed') {
            $timer.Stop()
            $result = Receive-Job $job -ErrorAction SilentlyContinue
            Remove-Job $job
            Write-Log $logBox $result
            Set-Status "Done: $label"
        }
    })
    $timer.Start()
}

# ── Helper: winget install ────────────────────────────────────────────────────
function Install-Winget($id, $name, $logBox) {
    Write-Log $logBox "Installing $name..."
    $job = Start-Job -ScriptBlock {
        param($pkg)
        winget install --id $pkg --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
    } -ArgumentList $id
    $timer = New-Object System.Windows.Threading.DispatcherTimer
    $timer.Interval = [TimeSpan]::FromSeconds(2)
    $timer.Add_Tick({
        if ($job.State -in 'Completed','Failed') {
            $timer.Stop()
            $r = Receive-Job $job -ErrorAction SilentlyContinue
            Remove-Job $job
            Write-Log $logBox "Finished: $name"
        }
    })
    $timer.Start()
}

# ── INSTALL: Select All / Clear All ──────────────────────────────────────────
$allChecks = @($ChkFiveM,$ChkSteam,$ChkRockstar,$ChkDiscord,$ChkFXSound,$ChkLossless,$ChkNvidia,$ChkDotNet,$Chk7Zip,$ChkRazer,$ChkActivate)

$BtnSelectAll.Add_Click({ foreach ($c in $allChecks) { if ($c.IsEnabled) { $c.IsChecked = $true } } })
$BtnClearAll.Add_Click({  foreach ($c in $allChecks) { if ($c.IsEnabled) { $c.IsChecked = $false } } })

# ── INSTALL: Install Selected ─────────────────────────────────────────────────
$BtnInstall.Add_Click({
    $InstallLog.Text = "[Log] Starting installation..."
    Set-Status "Installing selected programs..."

    $wingetPkgs = @{}
    if ($ChkDiscord.IsChecked  -and $ChkDiscord.IsEnabled)  { $wingetPkgs["Discord.Discord"] = "Discord" }
    if ($ChkSteam.IsChecked    -and $ChkSteam.IsEnabled)    { $wingetPkgs["Valve.Steam"] = "Steam" }
    if ($ChkRockstar.IsChecked -and $ChkRockstar.IsEnabled) { $wingetPkgs["Rockstar.RockstarGamesLauncher"] = "Rockstar Launcher" }
    if ($Chk7Zip.IsChecked     -and $Chk7Zip.IsEnabled)     { $wingetPkgs["7zip.7zip"] = "7-Zip" }
    if ($ChkFXSound.IsChecked  -and $ChkFXSound.IsEnabled)  { $wingetPkgs["FXSound.FXSound"] = "FXSound" }
    if ($ChkLossless.IsChecked -and $ChkLossless.IsEnabled) { $wingetPkgs["mifi.losslesscut"] = "LosslessCut" }
    if ($ChkRazer.IsChecked    -and $ChkRazer.IsEnabled)    { $wingetPkgs["Razer.RazerSynapse"] = "Razer Synapse" }

    foreach ($pkg in $wingetPkgs.GetEnumerator()) {
        Install-Winget $pkg.Key $pkg.Value $InstallLog
    }

    # NVIDIA Driver
    if ($ChkNvidia.IsChecked -and $ChkNvidia.IsEnabled) {
        Write-Log $InstallLog "Installing NVIDIA Driver 610.47 via winget..."
        Install-Winget "Nvidia.GeForce.Experience" "NVIDIA GeForce Experience" $InstallLog
    }

    # .NET Runtime
    if ($ChkDotNet.IsChecked -and $ChkDotNet.IsEnabled) {
        Write-Log $InstallLog "Installing .NET Runtime..."
        Install-Winget "Microsoft.DotNet.Runtime.9" ".NET Runtime" $InstallLog
    }

    # FiveM
    if ($ChkFiveM.IsChecked -and $ChkFiveM.IsEnabled) {
        Write-Log $InstallLog "Downloading FiveM from setup script..."
        Run-ScriptAsync "https://raw.githubusercontent.com/YamadaX9999/setuppc/main/setup.ps1" $InstallLog "FiveM + Settings"
    }

    # Activate Windows
    if ($ChkActivate.IsChecked) {
        Write-Log $InstallLog "Activating Windows (MAS)..."
        $job = Start-Job { irm https://massgrave.dev/get | iex }
    }
})

# ── TIMER: Install ─────────────────────────────────────────────────────────────
$BtnTimerInstall.Add_Click({
    $TimerLog.Text = "[Log] Installing Timer Resolution 0.5ms Scheduled Task..."
    Set-Status "Installing Timer Resolution task..."
    Run-ScriptAsync "https://raw.githubusercontent.com/YamadaX9999/timer-resoulution-0.5-ms/main/TimerResolutionMenu.ps1" $TimerLog "Timer Resolution 0.5ms"
})

# ── TIMER: Check Status ────────────────────────────────────────────────────────
$BtnTimerStatus.Add_Click({
    Write-Log $TimerLog "Checking Scheduled Task status..."
    $task = Get-ScheduledTask -TaskName "*Timer*" -ErrorAction SilentlyContinue
    if ($task) {
        Write-Log $TimerLog "Task found: $($task.TaskName) — State: $($task.State)"
        Set-Status "Timer task: $($task.State)"
    } else {
        Write-Log $TimerLog "No Timer Resolution task found. Run Install first."
        Set-Status "Timer task: Not installed"
    }
})

# ── TIMER: Uninstall ───────────────────────────────────────────────────────────
$BtnTimerRemove.Add_Click({
    Write-Log $TimerLog "Removing Timer Resolution task..."
    $task = Get-ScheduledTask -TaskName "*Timer*" -ErrorAction SilentlyContinue
    if ($task) {
        Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
        Write-Log $TimerLog "Task removed successfully."
        Set-Status "Timer task removed"
    } else {
        Write-Log $TimerLog "No task found to remove."
    }
})

# ── MSI UTILITY: Download & Run ───────────────────────────────────────────────
$BtnMsiRun.Add_Click({
    $MsiLog.Text = "[Log] Downloading MSI Utility v3..."
    Set-Status "Downloading MSI Utility v3..."

    $dest = "$env:TEMP\MsiUtilityV3.exe"
    $url  = "https://github.com/Sathango/Msi-Utility-v3/releases/latest/download/MSI_Utility_V3.exe"

    $job = Start-Job -ScriptBlock {
        param($u, $d)
        try {
            if (Test-Path $d) { Remove-Item $d -Force -ErrorAction SilentlyContinue }

            Invoke-WebRequest -Uri $u -OutFile $d -UseBasicParsing -ErrorAction Stop

            if (-not (Test-Path $d)) {
                return "ERROR: ดาวน์โหลดเสร็จแต่ไม่พบไฟล์ที่ $d — Windows Defender อาจลบไฟล์ทิ้งทันที (เช็คได้ที่ Windows Security > Protection history)"
            }

            $size = (Get-Item $d).Length

            # เช็คว่าไฟล์ที่ได้เป็น .exe จริง (เริ่มด้วย MZ header) หรือเป็นหน้า error/HTML ที่ดาวน์โหลดมาแทน
            $bytes = New-Object byte[] 2
            $fs = [System.IO.File]::OpenRead($d)
            [void]$fs.Read($bytes, 0, 2)
            $fs.Close()

            if ($bytes[0] -ne 0x4D -or $bytes[1] -ne 0x5A) {
                Remove-Item $d -Force -ErrorAction SilentlyContinue
                return "ERROR: ไฟล์ที่ได้ ($size bytes) ไม่ใช่ไฟล์ .exe จริง (ไม่มี MZ header) — ลิงก์ดาวน์โหลดน่าจะผิด/ไม่มีไฟล์ release ที่ปลายทาง ได้หน้า error/HTML กลับมาแทน"
            }

            # เอา Mark-of-the-Web ออก ไม่ให้ SmartScreen เด้งเตือนแบบเงียบๆแล้วไม่เปิดอะไรขึ้นมาเลย
            Unblock-File -Path $d -ErrorAction SilentlyContinue

            Start-Process $d -ErrorAction Stop
            "Downloaded and launched: $d (size: $([math]::Round($size/1KB,1)) KB)"
        } catch {
            "ERROR: $($_.Exception.Message)"
        }
    } -ArgumentList $url, $dest

    $timer = New-Object System.Windows.Threading.DispatcherTimer
    $timer.Interval = [TimeSpan]::FromSeconds(1)
    $timer.Add_Tick({
        if ($job.State -in 'Completed','Failed') {
            $timer.Stop()
            $r = Receive-Job $job -ErrorAction SilentlyContinue
            Remove-Job $job
            Write-Log $MsiLog $r
            if ($r -match '^ERROR') {
                Set-Status "MSI Utility: ดาวน์โหลด/เปิดไม่สำเร็จ — ดู Log ด้านล่าง"
            } else {
                Set-Status "MSI Utility launched"
            }
        }
    })
    $timer.Start()
})

# ── MSI UTILITY: Open Folder ──────────────────────────────────────────────────
$BtnMsiOpenFolder.Add_Click({
    Start-Process explorer.exe $env:TEMP
})

# ── Show window ───────────────────────────────────────────────────────────────
$window.ShowDialog() | Out-Null
