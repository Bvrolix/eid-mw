:: set all path variables
:: ======================
@call "%~dp0.\SetPaths.bat"
@if %ERRORLEVEL%==1 goto paths_failed

:: get eidmw version
:: =================
@call "%~dp0.\set_eidmw_version.cmd"

set OUR_CURRENT_PATH="%cd%"
@echo OUR_CURRENT_PATH = %OUR_CURRENT_PATH% 

set MDRVINSTALLPATH=%~dp0..\..\installers\quickinstaller\Drivers\WINALL
set MDRVCERTPATH=%~dp0..\..\cardcomm\minidriver\makemsi


:: sign pkcs11
:: ===========

@echo [INFO] Sign the pkcs11_ff dll, 32bit
"%SIGNTOOL_PATH%\signtool" sign /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\cardcomm\VS_2015\Binaries\Win32_PKCS11_FF_Release\beid_ff_pkcs11.dll"
@echo [INFO] Sign the pkcs11_ff dll, 64bit
"%SIGNTOOL_PATH%\signtool" sign /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\cardcomm\VS_2015\Binaries\x64_PKCS11_FF_Release\beid_ff_pkcs11.dll"


:: create the MSI installers
:: =========================

::need current dir to be pointing at one of the wxs files, or light.exe can't find the paths
@cd %~dp0..\..\installers\eid-viewer\Windows

@echo [INFO] Sign the eID Viewer executable
"%SIGNTOOL_PATH%\signtool" sign /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\plugins_tools\eid-viewer\Windows\eIDViewer\bin\Release\eIDViewer.exe"
"%SIGNTOOL_PATH%\signtool" sign /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\plugins_tools\eid-viewer\Windows\eIDViewer\bin\Release\eIDViewerBackend.dll"
@if %ERRORLEVEL%==1 goto signtool_failed

@echo [INFO] create eID Viewer msi installer
@call "%~dp0..\..\installers\eid-viewer\Windows\build_msi_eidviewer.cmd"
@if %ERRORLEVEL%==1 goto end_resetpath_with_error

@echo [INFO] sign eID Viewer msi installer
"%SIGNTOOL_PATH%\signtool" sign /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\installers\eid-viewer\Windows\bin\BeidViewer.msi"
@if "%ERRORLEVEL%" == "1" goto signtool_failed
@echo [INFO] copy 64 bit msi installer
copy %~dp0..\..\installers\eid-viewer\Windows\bin\BeidViewer.msi %~dp0

@cd "%OUR_CURRENT_PATH%"


:: create the NSIS installer
:: =========================


@echo [INFO] Make nsis viewer installer
"%NSIS_PATH%\makensis.exe" "%~dp0..\..\installers\quickinstaller\eIDViewerInstaller.nsi"
@if %ERRORLEVEL%==1 goto end_resetpath

:: sign the nsis installer
:: =======================

@echo [INFO] sign nsis viewer installer
"%SIGNTOOL_PATH%\signtool" sign /n "FedICT" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /t http://timestamp.verisign.com/scripts/timestamp.dll /v "%~dp0..\..\installers\quickinstaller\Belgium eID Viewer Installer %BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%.exe"
"%SIGNTOOL_PATH%\signtool" sign /as /fd SHA256 /s MY /n "Fedict" /sha1 "2259EF223A51E91964D7F4695706091194E018BB" /tr http://timestamp.globalsign.com/?signature=sha2 /td SHA256 /v "%~dp0..\..\installers\quickinstaller\Belgium eID Viewer Installer %BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%.exe"
@if "%ERRORLEVEL%" == "1" goto signtool_failed

@echo [INFO] copy nsis installer
copy "%~dp0..\..\installers\quickinstaller\Belgium eID Viewer Installer %BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%.exe" %~dp0
goto end_resetpath


:msbuild_failed
@echo [ERR ] msbuild failed
@goto err

:inf2cat_failed_failed
@echo [ERR ] inf2cat_failed failed
@goto err

:makecert_failed
@echo [ERR ] makecert failed
@goto err

:signtool_failed
@echo [ERR ] signtool failed
@goto err

:end_resetpath_with_error
@echo [ERR ] failed to create the MSI installer
@goto err

:paths_failed
@echo [ERR ] could not set patsh
@goto err

:end_resetpath
@cd %OUR_CURRENT_PATH%

@echo [INFO] Build_all Done...
@goto end

:err
@exit /b 1

:end

