@echo off


echo Request administrator privileges
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
echo Success gain administrator privileges

cd /d "%~dp0"
echo Enter directory

del -f autorun.inf
echo Del autorun

echo Setting file properties ......
attrib -s -r -a -h /d /s
attrib +s +h "System Volume Information"
echo Success

TIMEOUT /T 3 /NOBREAK
exit