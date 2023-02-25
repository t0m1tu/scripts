@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin

set ip=0.0.0.0
set port=8080
netstat -ano|findstr %ip%:%port%|findstr -i LISTENING
if ERRORLEVEL 1 (goto err) else (goto ok)

:err
cd "C:\Program Files (x86)\NetEase\CloudMusic" && start cloudmusic.exe && npx @nondanee/unblockneteasemusic -p 8080:8081 -f 59.111.19.33

:ok
cd "C:\Program Files (x86)\NetEase\CloudMusic" && start cloudmusic.exe


