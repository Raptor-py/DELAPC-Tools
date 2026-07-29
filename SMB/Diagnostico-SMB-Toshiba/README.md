# Diagnostico SMB Toshiba

Herramienta desarrollada por **DELAPC Tools** para diagnosticar y solucionar problemas de acceso SMB entre equipos Windows y dispositivos multifunción Toshiba e-STUDIO.

## Descripción

En versiones recientes de Windows, especialmente Windows 11, se han reforzado las políticas de seguridad del protocolo SMB (Server Message Block).

Estas políticas pueden impedir la conexión hacia algunos dispositivos que utilizan carpetas compartidas SMB, como la memoria interna de equipos multifunción Toshiba e-STUDIO.

## Problema solucionado

Esta herramienta está orientada a solucionar errores como:
No puedes acceder a esta carpeta compartida porque el equipo está configurado para requerir la firma SMB.

Este problema ocurre cuando Windows tiene habilitada la opción de requerir firma SMB obligatoria y el dispositivo remoto no utiliza una configuración compatible.

## ¿Qué hace la herramienta?

La herramienta realiza las siguientes acciones:

- Verifica la configuración SMB del equipo Windows.
- Comprueba el estado de `RequireSecuritySignature`.
- Detecta si Windows está obligando la firma SMB.
- Solicita confirmación antes de aplicar cambios.
- Desactiva la firma SMB obligatoria cuando corresponde.
- No modifica la configuración si el problema no está presente.

## Requisitos

- Windows 10 o Windows 11.
- PowerShell habilitado.
- Ejecutar con permisos de administrador.

## Uso

Ejecutar:
Diagnostico-SMB-Toshiba.bat

El lanzador solicitará automáticamente permisos elevados de administrador.

## Archivos incluidos

### Diagnostico-SMB-Toshiba.ps1

Script principal encargado del diagnóstico y aplicación de la corrección SMB.

### Ejecutar-Diagnostico-SMB-Toshiba.bat

Archivo lanzador que ejecuta el script PowerShell con privilegios administrativos.

## Notas importantes

Esta herramienta modifica una política de seguridad SMB del cliente Windows para permitir compatibilidad con dispositivos que no soportan firma SMB obligatoria.

Antes de aplicarla en entornos empresariales, se recomienda evaluar las políticas de seguridad existentes.

## Autor

**DELAPC**  
Coded by **Raptor**
