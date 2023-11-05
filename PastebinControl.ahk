SingleInstance,Force
!1::
BinID:= "https://pastebin.com/raw/" ; Bins Path to Raw Ex.If your bin host is Pastebin then BinID:= "https://pastebin.com/raw/"
PasteID:= 00000000 ;  Ex. If your paste is at https://pastebin.com/raw/00000000 then PasteID:= 00000000
RawPaste = % BinID PasteID
FileDelete, %A_Temp%/%PasteID%
Run, wget.exe --directory-prefix=%A_Temp%/ %RawPaste%,, Hide
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
		Goto, Disable
		return
	}
	else
	{
		Goto, Delete
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

Disable:
msgbox, code to disable script.
return

Delete:
msgbox, code to delete the script.
return
