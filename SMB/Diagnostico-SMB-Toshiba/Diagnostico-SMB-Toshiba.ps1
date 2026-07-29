# ==============================================
# DELAPC Tools
# Diagnostico SMB Signing - Toshiba e-STUDIO
#
# Coded by Raptor
# ==============================================

Clear-Host

Write-Host "======================================" -ForegroundColor Cyan
Write-Host " DELAPC Tools"
Write-Host " Diagnostico SMB Signing - Toshiba"
Write-Host " Coded by Raptor"
Write-Host "======================================"
Write-Host ""

$config = Get-SmbClientConfiguration

$Require = $config.RequireSecuritySignature
$Enable  = $config.EnableSecuritySignature

Write-Host "Configuracion actual SMB:"
Write-Host "--------------------------------------"
Write-Host "RequireSecuritySignature : $Require"
Write-Host "EnableSecuritySignature  : $Enable"
Write-Host ""

if ($Require -eq $true) {

    Write-Host "======================================" -ForegroundColor Red
    Write-Host " PROBLEMA DETECTADO"
    Write-Host "======================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Windows tiene habilitada la firma SMB obligatoria."
    Write-Host ""
    Write-Host "Esta configuracion puede impedir el acceso"
    Write-Host "a carpetas SMB de dispositivos como"
    Write-Host "Toshiba e-STUDIO."
    Write-Host ""

    $respuesta = Read-Host "Desea aplicar la correccion? (S/N)"

    if ($respuesta -eq "S" -or $respuesta -eq "s") {

        Set-SmbClientConfiguration -RequireSecuritySignature $false -Force

        Write-Host ""
        Write-Host "Correccion aplicada correctamente." -ForegroundColor Green
        Write-Host ""
        Write-Host "RequireSecuritySignature ahora esta en False."
        Write-Host "Se recomienda reiniciar Windows."
    }
    else {

        Write-Host ""
        Write-Host "No se realizaron cambios." -ForegroundColor Yellow
    }

}
else {

    Write-Host "======================================" -ForegroundColor Green
    Write-Host " CONFIGURACION CORRECTA"
    Write-Host "======================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "RequireSecuritySignature ya esta desactivado."
    Write-Host ""
    Write-Host "Este no parece ser el problema SMB."
    Write-Host ""
    Write-Host "No se realizaron cambios."
}

Write-Host ""
Write-Host "======================================"
Write-Host " Estado final SMB"
Write-Host "======================================"

Get-SmbClientConfiguration | Select RequireSecuritySignature, EnableSecuritySignature

Write-Host ""
Write-Host "======================================"
Write-Host " Diagnostico finalizado"
Write-Host " DELAPC Tools - Coded by Raptor"
Write-Host "======================================"

Pause