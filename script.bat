@echo off
:: Verificar si XAMPP está corriendo
tasklist /FI "IMAGENAME eq httpd.exe" | find /I "httpd.exe" >nul
if %ERRORLEVEL% equ 0 (
    echo XAMPP ya está corriendo.
) else (
    echo Iniciando XAMPP...
    start "" "C:\xampp\xampp-control.exe"
    timeout /t 10 /nobreak >nul
)
:: Ejecutar el script PHP
"C:\xampp\php\php.exe" "C:\xampp\htdocs\xbase\thor.php"