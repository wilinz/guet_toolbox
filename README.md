# Guet-Toolbox

Windows 安装 openssl，安装路径：C:\Program Files\OpenSSL-Win64
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install openssl
```
Linux 安装 openssl
```shell
apt install libssl-dev
```

Flutter 生成代码
```shell
   flutter pub run build_runner build
```

Web运行在指定端口
```shell
flutter run -d chrome --web-port 8888  --web-hostname 0.0.0.0
```