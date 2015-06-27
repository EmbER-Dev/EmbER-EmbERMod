@echo off
ECHO ----------------------------------------
echo Creating EmbERMod Build Folder
IF Exist ..\..\project\Win32BuildSetup\BUILD_WIN32\application\addons\skin.embermod rmdir ..\..\project\Win32BuildSetup\BUILD_WIN32\application\addons\skin.embermod /S /Q
md ..\..\project\Win32BuildSetup\BUILD_WIN32\application\addons\skin.embermod\media\

Echo .svn>exclude.txt
Echo Thumbs.db>>exclude.txt
Echo Desktop.ini>>exclude.txt
Echo dsstdfx.bin>>exclude.txt
Echo build.bat>>exclude.txt
Echo \skin.embermod\media\>>exclude.txt
Echo exclude.txt>>exclude.txt

ECHO ----------------------------------------
ECHO Creating XBT File...
START /B /WAIT ..\..\Tools\TexturePacker\TexturePacker -dupecheck -input media -output ..\..\project\Win32BuildSetup\BUILD_WIN32\application\addons\skin.embermod\media\Textures.xbt

ECHO ----------------------------------------
ECHO XBT Texture Files Created...
ECHO Building Skin Directory...
xcopy "..\skin.embermod" "..\..\project\Win32BuildSetup\BUILD_WIN32\application\addons\skin.embermod" /E /Q /I /Y /EXCLUDE:exclude.txt

del exclude.txt
