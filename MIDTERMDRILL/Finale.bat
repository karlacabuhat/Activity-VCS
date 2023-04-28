@echo off

:Compression
set /p compression=Do you want to continue compress your folders (Y/N)?
if not "%compression%"=="Y" (
  if not "%compression%"=="N" (
    echo Invalid Input.
    echo Please Enter Y or N.
    goto Compression
  )
)

@for /D %%I in (".\*") do (
  echo started at %date% %time% compressing "%%I"........................ @"%ProgramFiles%\WinRAR\Rar.exe" a -cfg- -ep1 -inul -m5 -r -- "%%I.rar" "%%I\"
)
echo Compress Successfully
Pause

set /p password=Enter your desired Password, you can leave it blank as no desired for password:
set /p comment=Enter your desired comment, you can leave it blank for no comment:
set /p delete=Do you want to delete original folders after compression? (Y/N):

if not "%password%"=="" set rar=%rar%-p"%password%"
if not "%comment%"=="" set rar=%rar% -c-"%comment%"

if %delete%==Y goto Y
if %delete%==N goto N
:Y
rmdir /s /q  "C:\Users\User\Desktop\MIDTERMDRILL"
echo Done!
:N
goto done

:done
Pause