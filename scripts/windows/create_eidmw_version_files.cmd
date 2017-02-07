:: creates the version files used by NSIS, Wix and MSBuild

:: retrieve the version numbers
@call "%~dp0.\set_eidmw_version.cmd"

:write_eidmw_revision_h
:: create eidmw_revision.h file
::  @echo //do not change the content of this file, it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd > "%~dp0\eidmw_revision.h"
::  @echo #ifndef __EIDMW_REVISION_H__                 >>  "%~dp0\eidmw_revision.h"
::  @echo #define __EIDMW_REVISION_H__                 >> "%~dp0\eidmw_revision.h"
::  @echo #define EIDMW_REVISION %EIDMW_REVISION%        >> "%~dp0\eidmw_revision.h"
::  @echo #define EIDMW_REVISION_STR "%EIDMW_REVISION%"  >> "%~dp0\eidmw_revision.h"
::  @echo #endif //__EIDMW_REVISION_H__                >> "%~dp0\eidmw_revision.h"

:write_eidmw_revision_wix
@echo write_eidmw_revision_wix
@echo ^<!-- > "%~dp0\eidmw_revision.wxs"
@echo do not change the content of this file, it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd >> "%~dp0\eidmw_revision.wxs"
@echo --^> >> "%~dp0\eidmw_revision.wxs"
@echo ^<Include^> >> "%~dp0\eidmw_revision.wxs"
@echo ^<?define BaseVersion1=%BASE_VERSION1%?^> >>"%~dp0\eidmw_revision.wxs"
@echo ^<?define BaseVersion2=%BASE_VERSION2%?^> >>"%~dp0\eidmw_revision.wxs"
@echo ^<?define BaseVersion3=%BASE_VERSION3%?^> >>"%~dp0\eidmw_revision.wxs"
@echo ^<?define RevisionNumber=%EIDMW_REVISION%?^> >>"%~dp0\eidmw_revision.wxs"
@echo ^</Include^> >>"%~dp0\eidmw_revision.wxs"

:write_eidmw_version.nsh
@echo write_eidmw_version.nsh
@echo ;do not change the content of this file, it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd > "%~dp0..\..\installers\quickinstaller\eidmw_version.nsh"
@echo !define EIDMW_VERSION ^"%BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%^" >> "%~dp0..\..\installers\quickinstaller\eidmw_version.nsh"
@echo !define EIDMW_VERSION_SHORT ^"%BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%^" >>  "%~dp0..\..\installers\quickinstaller\eidmw_version.nsh"

:write_beidversions.h
@echo write_beidversions.h
@echo #ifndef __BEID_VERSION_H__ > "%~dp0\beidversions.h"
@echo #define __BEID_VERSION_H__ >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo /**                                                                         >> "%~dp0\beidversions.h"																					
@echo  * Versions for the Windows binaries                                        >> "%~dp0\beidversions.h"
@echo  *  >> "%~dp0\beidversions.h"
@echo  * do not change the content of this file, it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd  >> "%~dp0\beidversions.h"
@echo  */                                                                         >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
::@echo #include "./eidmw_revision.h"                                               >> "%~dp0\beidversions.h"
@echo // To specified in the .rc files                                            >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo #define BEID_COMPANY_NAME    	"Belgian Government"                          >> "%~dp0\beidversions.h"
@echo #define BEID_COPYRIGHT    	"Copyright (C) 2017"                          >> "%~dp0\beidversions.h"
@echo #define BEID_PRODUCT_NAME    	"Belgium eID MiddleWare"                      >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo #define BEID_PRODUCT_VERSION   "%BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%" >> "%~dp0\beidversions.h"
@echo #define BASE_VERSION_STRING    "%BASE_VERSION1%, %BASE_VERSION2%, %BASE_VERSION3%, " >> "%~dp0\beidversions.h"
@echo #define BASE_VERSION1          %BASE_VERSION1%                              >> "%~dp0\beidversions.h"
@echo #define BASE_VERSION2          %BASE_VERSION2%                              >> "%~dp0\beidversions.h"
@echo #define BASE_VERSION3          %BASE_VERSION3%                              >> "%~dp0\beidversions.h"
@echo #define EIDMW_REVISION         %EIDMW_REVISION%        >> "%~dp0\beidversions.h"
@echo #define EIDMW_REVISION_STR     "%EIDMW_REVISION%"  >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // Common Lib                                                               >> "%~dp0\beidversions.h"
@echo #define WIN_CL_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR     >> "%~dp0\beidversions.h"
@echo #define WIN_CL_VERSION1          BASE_VERSION1                              >> "%~dp0\beidversions.h"
@echo #define WIN_CL_VERSION2          BASE_VERSION2                              >> "%~dp0\beidversions.h"
@echo #define WIN_CL_VERSION3          BASE_VERSION3                              >> "%~dp0\beidversions.h"
@echo #define WIN_CL_VERSION4          EIDMW_REVISION                             >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // Card Abstraction                                                         >> "%~dp0\beidversions.h"
@echo #define WIN_CAL_VERSION_STRING   BASE_VERSION_STRING EIDMW_REVISION_STR     >> "%~dp0\beidversions.h"
@echo #define WIN_CAL_VERSION1         BASE_VERSION1                              >> "%~dp0\beidversions.h"
@echo #define WIN_CAL_VERSION2         BASE_VERSION2                              >> "%~dp0\beidversions.h"
@echo #define WIN_CAL_VERSION3         BASE_VERSION3                              >> "%~dp0\beidversions.h"
@echo #define WIN_CAL_VERSION4         EIDMW_REVISION                             >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // Dialogs                                                                  >> "%~dp0\beidversions.h"
@echo #define WIN_DLG_VERSION_STRING   BASE_VERSION_STRING EIDMW_REVISION_STR     >> "%~dp0\beidversions.h"
@echo #define WIN_DLG_VERSION1         BASE_VERSION1                              >> "%~dp0\beidversions.h"
@echo #define WIN_DLG_VERSION2         BASE_VERSION2                              >> "%~dp0\beidversions.h"
@echo #define WIN_DLG_VERSION3         BASE_VERSION3                              >> "%~dp0\beidversions.h"
@echo #define WIN_DLG_VERSION4         EIDMW_REVISION                             >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // CSP                                                                      >> "%~dp0\beidversions.h"
@echo #define WIN_CSP_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR    >> "%~dp0\beidversions.h"
@echo #define WIN_CSP_VERSION1          BASE_VERSION1                             >> "%~dp0\beidversions.h"
@echo #define WIN_CSP_VERSION2          BASE_VERSION2                             >> "%~dp0\beidversions.h"
@echo #define WIN_CSP_VERSION3          BASE_VERSION3                             >> "%~dp0\beidversions.h"
@echo #define WIN_CSP_VERSION4          EIDMW_REVISION                            >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // MDRV                                                                     >> "%~dp0\beidversions.h"
@echo #define WIN_MDRV_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR   >> "%~dp0\beidversions.h"
@echo #define WIN_MDRV_VERSION1          BASE_VERSION1                            >> "%~dp0\beidversions.h"
@echo #define WIN_MDRV_VERSION2          BASE_VERSION2                            >> "%~dp0\beidversions.h"
@echo #define WIN_MDRV_VERSION3          BASE_VERSION3                            >> "%~dp0\beidversions.h"
@echo #define WIN_MDRV_VERSION4          EIDMW_REVISION                           >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // cardplugin BEID                                                          >> "%~dp0\beidversions.h"
@echo #define WIN_CPBEID_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR >> "%~dp0\beidversions.h"
@echo #define WIN_CPBEID_VERSION1          BASE_VERSION1                          >> "%~dp0\beidversions.h"
@echo #define WIN_CPBEID_VERSION2          BASE_VERSION2                          >> "%~dp0\beidversions.h"
@echo #define WIN_CPBEID_VERSION3          BASE_VERSION3                          >> "%~dp0\beidversions.h"
@echo #define WIN_CPBEID_VERSION4          EIDMW_REVISION                         >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // PKCS11                                                                   >> "%~dp0\beidversions.h"
@echo #define WIN_PKCS11_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR >> "%~dp0\beidversions.h"
@echo #define WIN_PKCS11_VERSION1          BASE_VERSION1                          >> "%~dp0\beidversions.h"
@echo #define WIN_PKCS11_VERSION2          BASE_VERSION2                          >> "%~dp0\beidversions.h"
@echo #define WIN_PKCS11_VERSION3          BASE_VERSION3                          >> "%~dp0\beidversions.h"
@echo #define WIN_PKCS11_VERSION4          EIDMW_REVISION                         >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // CLEANUPTOOL                                                              >> "%~dp0\beidversions.h"
@echo #define WIN_CLEAN_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR  >> "%~dp0\beidversions.h"
@echo #define WIN_CLEAN_VERSION1          BASE_VERSION1                           >> "%~dp0\beidversions.h"
@echo #define WIN_CLEAN_VERSION2          BASE_VERSION2                           >> "%~dp0\beidversions.h"
@echo #define WIN_CLEAN_VERSION3          BASE_VERSION3                           >> "%~dp0\beidversions.h"
@echo #define WIN_CLEAN_VERSION4          EIDMW_REVISION                          >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo // SCCERTPROP                                                               >> "%~dp0\beidversions.h"
@echo #define WIN_SCCERT_VERSION_STRING    BASE_VERSION_STRING EIDMW_REVISION_STR >> "%~dp0\beidversions.h"
@echo #define WIN_SCCERT_VERSION1          BASE_VERSION1                          >> "%~dp0\beidversions.h"
@echo #define WIN_SCCERT_VERSION2          BASE_VERSION2                          >> "%~dp0\beidversions.h"
@echo #define WIN_SCCERT_VERSION3          BASE_VERSION3                          >> "%~dp0\beidversions.h"
@echo #define WIN_SCCERT_VERSION4          EIDMW_REVISION                         >> "%~dp0\beidversions.h"
@echo: >> "%~dp0\beidversions.h"
@echo #endif //__BEID_VERSION_H__                                                 >> "%~dp0\beidversions.h"

:write_AssemblyInfo.cs
@echo write_AssemblyInfo.cs
set ASSEMBLYINFO_PATH="%~dp0..\..\plugins_tools\eid-viewer\Windows\eIDViewer\Properties\AssemblyInfo.cs"
@echo ASSEMBLYINFO_PATH = %ASSEMBLYINFO_PATH%
@echo //do not change the content of this file,> %ASSEMBLYINFO_PATH%
@echo //it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo using System.Reflection; >> %ASSEMBLYINFO_PATH%
@echo using System.Resources; >> %ASSEMBLYINFO_PATH%
@echo using System.Runtime.CompilerServices; >> %ASSEMBLYINFO_PATH%
@echo using System.Runtime.InteropServices; >> %ASSEMBLYINFO_PATH%
@echo using System.Windows; >> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo // General Information about an assembly is controlled through the following >> %ASSEMBLYINFO_PATH%
@echo // set of attributes. Change these attribute values to modify the information>> %ASSEMBLYINFO_PATH%
@echo // associated with an assembly.>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyTitle("eIDViewer")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyDescription("")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyConfiguration("")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyCompany("")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyProduct("eIDViewer")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyCopyright("Copyright ©  2017")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyTrademark("")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyCulture("")]>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo // Setting ComVisible to false makes the types in this assembly not visible >> %ASSEMBLYINFO_PATH%
@echo // to COM components.  If you need to access a type in this assembly from >> %ASSEMBLYINFO_PATH%
@echo // COM, set the ComVisible attribute to true on that type.>> %ASSEMBLYINFO_PATH%
@echo [assembly: ComVisible(false)]>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo //In order to begin building localizable applications, set >> %ASSEMBLYINFO_PATH%
@echo //^<UICulture^>CultureYouAreCodingWith^</UICulture^> in your .csproj file>> %ASSEMBLYINFO_PATH%
@echo //inside a ^<PropertyGroup^>.  For example, if you are using US english>> %ASSEMBLYINFO_PATH%
@echo //in your source files, set the ^<UICulture^> to en-US.  Then uncomment>> %ASSEMBLYINFO_PATH%
@echo //the NeutralResourceLanguage attribute below.  Update the "en-US" in>> %ASSEMBLYINFO_PATH%
@echo //the line below to match the UICulture setting in the project file.>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo //[assembly: NeutralResourcesLanguage("en-US", UltimateResourceFallbackLocation.Satellite)]>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo [assembly: ThemeInfo(>> %ASSEMBLYINFO_PATH%
@echo     ResourceDictionaryLocation.None, //where theme specific resource dictionaries are located>> %ASSEMBLYINFO_PATH%
@echo     //(used if a resource is not found in the page, >> %ASSEMBLYINFO_PATH%
@echo     // or application resource dictionaries)>> %ASSEMBLYINFO_PATH%
@echo     ResourceDictionaryLocation.SourceAssembly //where the generic resource dictionary is located>> %ASSEMBLYINFO_PATH%
@echo     //(used if a resource is not found in the page, >> %ASSEMBLYINFO_PATH%
@echo     // app, or any theme specific resource dictionaries)>> %ASSEMBLYINFO_PATH%
@echo )]>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo // Version information for an assembly consists of the following four values:>> %ASSEMBLYINFO_PATH%
@echo //>> %ASSEMBLYINFO_PATH%
@echo //      Major Version>> %ASSEMBLYINFO_PATH%
@echo //      Minor Version >> %ASSEMBLYINFO_PATH%
@echo //      Build Number>> %ASSEMBLYINFO_PATH%
@echo //      Revision>> %ASSEMBLYINFO_PATH%
@echo //>> %ASSEMBLYINFO_PATH%
@echo // You can specify all the values or you can default the Build and Revision Numbers >> %ASSEMBLYINFO_PATH%
@echo // by using the '*' as shown below:>> %ASSEMBLYINFO_PATH%
@echo // [assembly: AssemblyVersion("1.0.*")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyVersion("%BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%")]>> %ASSEMBLYINFO_PATH%
@echo [assembly: AssemblyFileVersion("%BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%.%EIDMW_REVISION%")]>> %ASSEMBLYINFO_PATH%
:write_About.cs
@echo write_About.cs
set ASSEMBLYINFO_PATH="%~dp0..\..\plugins_tools\eid-viewer\Windows\eIDViewer\Sources\About.cs"
@echo ASSEMBLYINFO_PATH = %ASSEMBLYINFO_PATH%
@echo //do not change the content of this file,> %ASSEMBLYINFO_PATH%
@echo //it is generated by eid-mw\scripts\windows\create_eidmw_version_files.cmd>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo namespace eIDViewer>> %ASSEMBLYINFO_PATH%
@echo {>> %ASSEMBLYINFO_PATH%
@echo     public static class About>> %ASSEMBLYINFO_PATH%
@echo     {>> %ASSEMBLYINFO_PATH%
@echo         public static string AboutMessage()>> %ASSEMBLYINFO_PATH%
@echo         {>> %ASSEMBLYINFO_PATH%
@echo             string message = ^@^"eID Viewer %BASE_VERSION1%.%BASE_VERSION2%.%BASE_VERSION3%>> %ASSEMBLYINFO_PATH%
@echo eID Middleware Project>> %ASSEMBLYINFO_PATH%
@echo Copyright(C) 2017 Fedict>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo By Frederik Vernelen and Wouter Verhelst>> %ASSEMBLYINFO_PATH%
@echo Based on the design of Frank Marien>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo This is free software; you can redistribute it and / or modify it>> %ASSEMBLYINFO_PATH%
@echo under the terms of the GNU Lesser General Public License version >> %ASSEMBLYINFO_PATH%
@echo 3.0 as published by the Free Software Foundation.>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo This software is distributed in the hope that it will be useful,>> %ASSEMBLYINFO_PATH%
@echo but WITHOUT ANY WARRANTY; without even the implied warranty of>> %ASSEMBLYINFO_PATH%
@echo MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the GNU >> %ASSEMBLYINFO_PATH%
@echo Lesser General Public License for more details.>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo You should have received a copy of the GNU Lesser General Public >> %ASSEMBLYINFO_PATH%
@echo License along with this software; if not, see >> %ASSEMBLYINFO_PATH%
@echo http://www.gnu.org/licenses>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo Official releases and support are available on http://eid.belgium.be>> %ASSEMBLYINFO_PATH%
@echo Source code and other files are available on https://github.com/Fedict/eid-viewer^";>> %ASSEMBLYINFO_PATH%
@echo:>> %ASSEMBLYINFO_PATH%
@echo             return message;>> %ASSEMBLYINFO_PATH%
@echo         }>> %ASSEMBLYINFO_PATH%
@echo     }>> %ASSEMBLYINFO_PATH%
@echo }>> %ASSEMBLYINFO_PATH%