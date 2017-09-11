SingleInstance,Force
!1::
PasteID = 00000000 ; Set to PasteID Ex. https://pastebin.com/raw/PasteID
FileDelete, %A_Temp%/%PasteID%
Run, wget.exe --directory-prefix=%A_Temp%/ https://pastebin.com/raw/%PasteID%,, Hide
SwitchExist:
IfNotExist, %A_Temp%/%PasteID%
{
	sleep, 100
	goto, SwitchExist
	return
}
else
{
	FileRead, Switch, %A_Temp%/%PasteID%
	If (Switch = 1)
	{
		goto, Working
		return
	}
	Else If (Switch = 2)
	{
		Goto, Disabled
		return
	}
	else
	{
		Goto, Killed
		return
	}
	sleep 500
	FileDelete, %A_Temp%/%PasteID%
	return
}
return

Working:
msgbox, normal working code.
return

Disabled:
msgbox, code to disable script.
return

Killed:
msgbox, code to delete the script.
return
