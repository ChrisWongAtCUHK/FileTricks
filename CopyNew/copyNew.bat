@REM copy the new file with date & time format
@ECHO OFF

@REM default file extension: .txt
@REM with input file extension
IF "%1" == "" GOTO USAGE
SET EXT=%1

@REM get the date in YYYYMMDD(for English format)
SET YEAR=%DATE:~-4%
SET MONTH=%DATE:~4,2%
IF "%MONTH:~0,1%" == " " SET MONTH=0%MONTH:~1,1%
SET DAY=%DATE:~7,2%
IF "%DAY:~0,1%" == " " SET DAY=0%DAY:~1,1%

@REM get the time in HHMMSS(for English format)
SET HOUR=%TIME:~0,2%
IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%
SET MIN=%TIME:~3,2%
IF "%MIN:~0,1%" == " " SET MIN=0%MIN:~1,1%
SET SEC=%TIME:~6,2%
IF "%SEC:~0,1%" == " " SET SEC=0%SEC:~1,1%

@REM date & time format
SET DATETIMEF=%YEAR%%MONTH%%DAY%_%HOUR%%MIN%%SEC%

@REM print out

@REM get the desired file(without date & time format)
FOR /F %%I IN ('DIR *.%EXT% /B /O:N') DO SET ORIGINAL=%%I & GOTO GETFILE

:GETFILE
ECHO %ORIGINAL%

@REM trim the extension
FOR /F "DELIMS=." %%A IN ("%ORIGINAL%") DO SET PART=%%A

@REM rename the file & exit
COPY %FIRST% %PART%---%DATETIMEF%.%EXT%
GOTO END

@REM usage display
:USAGE
ECHO Usage:
ECHO %0 extension

@REM end of script
:END
