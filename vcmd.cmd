@echo off
setlocal DisableDelayedExpansion
SETLOCAL

if "%1"=="" GOTO NeedParms
if "%2"=="" GOTO NeedParms

set "VAGRANT_VAGRANTFILE=%1"
vagrant %2
goto END

:NeedParms
echo vcmd need 2 parms. vagrantfile.conf and vagrant-comand (ex. up, ssh, destroy, etc.)
echo Ex: vcmd derv-bind01.vagrant up

:END
echo Done!
