;    timeless-tales.nsi - Windows NSIS Installer for Timeless Tales
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 2 of the License, or
;    (at your option) any later version.
;
;
; The game is only data, so the installer ships the engine it finds next to
; it in the build directory together with the game tree and the batch file
; that launches the engine with -d pointing at the installation. makensis is
; run with two defines from tools/ci-build.sh:
;
;   SRC  the source tree of the game, where the data and the launcher are
;   BIN  the build directory, holding stratagus.exe and its friends
;

!ifdef QUIET
!verbose 2
!endif

!include "MUI2.nsh"
!include "WinVer.nsh"
!include "LogicLib.nsh"

;--------------------------------
; General variables

!define NAME "Timeless Tales"
!define VERSION "3.3.3"
!define VIVERSION "${VERSION}.0"
!define HOMEPAGE "https://wargus.github.io"
!define LICENSE "GPL v2+"
!define COPYRIGHT "Copyright (c) 2012-2026 by The Stratagus Project"
!define EXE "timeless-tales.bat"

; Name the file without the space of the display name.
!define INSTALLER "Timeless-Tales-portable-${VERSION}.exe"
!define INSTALLDIR "$DESKTOP\${NAME}\"

; The Visual C runtime the engine is built against.
!define VCREDIST "vc_redist.x64.exe"
!define VCREDISTREGKEY "SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64"

;--------------------------------
; Installer pages

!define MUI_ICON "${SRC}\timeless-tales.ico"
!define MUI_UNICON "${SRC}\timeless-tales.ico"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_RUN "$INSTDIR\stratagus.exe"
!define MUI_FINISHPAGE_RUN_PARAMETERS "-d $\"$INSTDIR$\""

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;--------------------------------
; Available languages
!insertmacro MUI_LANGUAGE "English"

;--------------------------------

Name "${NAME}"
OutFile "${INSTALLER}"
InstallDir "${INSTALLDIR}"

VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${NAME} Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "${COPYRIGHT}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "License" "${LICENSE}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Homepage" "${HOMEPAGE}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${NAME} Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"
VIProductVersion "${VIVERSION}"

BrandingText "${NAME} ${VERSION}  ${HOMEPAGE}"
ShowInstDetails Show
XPStyle on
RequestExecutionLevel user

;--------------------------------
; The runtime the engine needs, fetched once at build time unless the
; machine it installs on already has it.

!ifndef NO_DOWNLOAD
!system "powershell -Command $\"& {if (-not (Test-Path '${VCREDIST}')) {wget 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/${VCREDIST}' -OutFile '${VCREDIST}'}}$\""
!endif

;--------------------------------

Section "${NAME}"

	SectionIn RO

	; The engine goes in first, where the launcher expects to find it.
	SetOutPath "$INSTDIR"
	!cd ${BIN}
	File "stratagus.exe"
	!cd ${SRC}
	File "launcher\${EXE}"

	ClearErrors
	ReadRegDword $R0 HKLM "${VCREDISTREGKEY}" "Installed"
	IfErrors 0 NoErrors
	StrCpy $R0 0
	NoErrors:
	${If} $R0 == 0
	  File "${VCREDIST}"
	  ExecWait "$\"$INSTDIR\${VCREDIST}$\" /passive /norestart"
	  Delete "$INSTDIR\${VCREDIST}"
	${EndIf}
	ClearErrors

	; The game is only data. Every directory of the tree ships as it is.
	!cd ${SRC}
	SetOutPath "$INSTDIR\campaigns"
	File /r "campaigns\"
	SetOutPath "$INSTDIR\graphics"
	File /r "graphics\"
	SetOutPath "$INSTDIR\maps"
	File /r "maps\"
	SetOutPath "$INSTDIR\music"
	File /r "music\"
	SetOutPath "$INSTDIR\scripts"
	File /r "scripts\"
	SetOutPath "$INSTDIR\sounds"
	File /r "sounds\"
	SetOutPath "$INSTDIR\vendor"
	File /r "vendor\"
	SetOutPath "$INSTDIR"
	File "timeless-tales.png"
	!cd ${BIN}

	CreateShortCut "$INSTDIR\${NAME}.lnk" "$INSTDIR\stratagus.exe" "-d $\"$INSTDIR$\""
	CreateShortCut "$INSTDIR\${NAME} (Safe graphics mode).lnk" "$INSTDIR\stratagus.exe" "-d $\"$INSTDIR$\" -g -W -v 640x480"

	; Mark the deployment as self-contained.
	!appendfile "$%temp%\compiletimefile" ""
	File "/oname=$INSTDIR\portable-install" "$%temp%\compiletimefile"

SectionEnd

;--------------------------------

Function .onInit
	; Check if the installer is already running
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${NAME}") i .r1 ?e'
	Pop $0
	StrCmp $0 0 +3

	MessageBox MB_OK|MB_ICONEXCLAMATION "${NAME} Installer is already running"
	Abort
FunctionEnd

; The runtime downloaded above is left in the build directory, which is
; transient: the CI copies the installer out of it and discards the rest.
