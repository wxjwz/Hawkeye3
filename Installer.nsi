; # [ zrfisaac ]

; # [ about ]
; # - author : Isaac Santana
; # . - email : zrfisaac@gmail.com
; # . - site : zrfisaac.github.io
; # - update : 2023-02-08

; # [ nsis ]

; # - library
!include "MUI2.nsh"
!include "x64.nsh"

; # - general
Name "Hawkeye 3.0.0"
OutFile "Hawkeye 3.0.0 Install.exe"
Unicode True
InstallDir "$PROGRAMFILES\Hawkeye"
InstallDirRegKey HKLM "SOFTWARE\Hawkeye" ""
RequestExecutionLevel admin
!define MUI_ICON "src\Hawkeye.ico" 
!define MUI_UNICON "src\Hawkeye.ico"

; # - shortcut
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "$(MUI_Shortcut)"
!define MUI_FINISHPAGE_RUN_FUNCTION "fnShortcut"
Function "fnShortcut"
	CreateShortCut "$DESKTOP\Hawkeye.lnk" "$INSTDIR\Hawkeye.exe" "" "$INSTDIR\hawkeye.ico"
FunctionEnd

; # - interface
!define MUI_ABORTWARNING

; # - page - install
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; # - page - uninstall
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; # - language
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "PortugueseBR"
Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; # - translation
LangString MUI_Shortcut ${LANG_ENGLISH} "Create desktop shortcut"
LangString MUI_Shortcut ${LANG_PORTUGUESEBR} "Criar atalho na área de trabalho"

; # - install - Hawkeye
Section Hawkeye
	; # : - required
	SectionIn RO

	; # : - file
	SetOutPath "$INSTDIR"
	File "src\Build\Release\*.*"
	File "src\hawkeye.ico"

	; # : - registry
	WriteRegStr HKLM "SOFTWARE\Hawkeye" "" $INSTDIR

	; # : - uninstaller
	WriteUninstaller "$INSTDIR\Uninstall.exe"

	; # : - menu
	CreateDirectory "$SMPROGRAMS\Hawkeye"
	CreateShortCut "$SMPROGRAMS\Hawkeye\Hawkeye.lnk" "$INSTDIR\Hawkeye.exe" "" "$INSTDIR\hawkeye.ico"

	; # : - control panel
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "DisplayName" "Hawkeye 3.0.0"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "QuietUninstallString" "$\"$INSTDIR\Uninstall.exe$\" /S"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "DisplayIcon" "$\"$INSTDIR\hawkeye.ico$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "Publisher" "Isaac Santana (zrfisaac@gmail.com)"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "HelpLink" "https://github.com/zrfisaac/Hawkeye3"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "URLUpdateInfo" "https://github.com/zrfisaac/Hawkeye3"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "URLInfoAbout" "https://github.com/zrfisaac/Hawkeye3"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "DisplayVersion" "3.0.0"
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "VersionMajor" 3
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "VersionMinor" 0
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "NoModify" 0
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "NoRepair" 0
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye" "EstimatedSize" 3556 ;KB
SectionEnd

; # - uninstall - Hawkeye
Section Un.Hawkeye
	; # : - required
	SectionIn RO

	; # : - file
	Delete "$INSTDIR\*.*"
	RMDir /r "$INSTDIR"

	; # : - menu
	Delete "$DESKTOP\Hawkeye.lnk"
	Delete "$INSTDIR\Hawkeye.lnk"
	RMDir /r "$SMPROGRAMS\Hawkeye"

	; # : - registry
	DeleteRegKey HKLM "SOFTWARE\Hawkeye"
	DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye"
SectionEnd
