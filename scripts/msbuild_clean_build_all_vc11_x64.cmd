REM VS2012 x64 Native Tools Command Prompt
REM Target: %comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"" amd64
REM Start in: "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\"

call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" amd64

msbuild ConsoleApplication\ConsoleApplication.sln /property:VisualStudioVersion=%VisualStudioVersion% /target:Clean,Build /property:PlatformTarget=x64 /property:Configuration="Debug" /maxcpucount /detailedsummary /verbosity:diagnostic /logger:FileLogger,Microsoft.Build.Engine;logfile=msbuild_consoleapplication_vc11_x64_debug.log;append=false;verbosity=diagnostic;encoding=utf-8 || if ERRORLEVEL 1 ( exit /b 42 )
msbuild ConsoleApplication\ConsoleApplication.sln /property:VisualStudioVersion=%VisualStudioVersion% /target:Clean,Build /property:PlatformTarget=x64 /property:Configuration="Release" /maxcpucount /detailedsummary /verbosity:diagnostic /logger:FileLogger,Microsoft.Build.Engine;logfile=msbuild_consoleapplication_vc11_x64_release.log;append=false;verbosity=diagnostic;encoding=utf-8 || if ERRORLEVEL 1 ( exit /b 42 )
