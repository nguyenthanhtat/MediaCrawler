# run-demo.ps1 - Chay demo MediaCrawler (da cau hinh san: tai video, 3 video/lan)
# Cach dung:  mo PowerShell tai thu muc nay roi go:  .\run-demo.ps1
# Doi platform: sua bien $Platform ben duoi (bili | dy | xhs | ks | bili | wb | tieba | zhihu)

$ErrorActionPreference = "Stop"

# --- Cau hinh nhanh ---
$Platform = "bili"          # nen tang: bili=Bilibili, dy=Douyin, xhs=Xiaohongshu
$Type     = "search"        # search=tim theo tu khoa | detail=1 video theo ID | creator=trang tac gia
$Keywords = "美食教程"       # tu khoa tim kiem (doi tuy y)
$Save     = "json"          # csv | json | jsonl | sqlite | excel

# --- Dam bao uv co tren PATH ---
$uvDir = "$env:APPDATA\Python\Python312\Scripts"
if (Test-Path "$uvDir\uv.exe") { $env:Path = "$uvDir;$env:Path" }

Set-Location $PSScriptRoot

Write-Host "==> Chay MediaCrawler: platform=$Platform type=$Type keywords=$Keywords" -ForegroundColor Cyan
Write-Host "==> Chrome se mo ra + hien ma QR. Dung app dien thoai quet de dang nhap." -ForegroundColor Yellow

uv run main.py --platform $Platform --lt qrcode --type $Type --keywords $Keywords --save_data_option $Save

Write-Host "==> Xong. Kiem tra du lieu trong thu muc: data\$Platform\" -ForegroundColor Green
