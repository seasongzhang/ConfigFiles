;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2
SetNumlockState AlwaysOn

Activate(title)
{
	IfWinActive,%title%
	{
		WinMinimize
		return
	}
	SetTitleMatchMode 2
	WinGet, winid, ID, %title%
	If (winid)
	{
		WinWait, ahk_id %winid%
		WinShow
		WinActivate
		return 1
	}
	DetectHiddenWindows, Off
	return 0
}

ActivateAndOpen(title,program,name,passcode)
{
	if Activate(title) == 0
	{

    	Run %program%
    	WinActivate
	    IfWinExist ,Total Commander ahk_class TNASTYNAGSCREEN
	    WinActivate
	    Sleep 500
	    ControlGetText ,TCText, TPanel2
	    if TCText = 1
    		ControlClick ,TButton3
	    else if TCText = 2
    		ControlClick ,TButton2
	    else
    		ControlClick ,TButton1
	    ;Send {Enter}
	    return
    }
}


;[快捷方式]
#1::ActivateAndOpen("Total Commander 8.01 - NOT REGISTERED","C:\totalcmd\TOTALCMD.EXE","","")
#2::ActivateAndOpen("Firefox","C:\Program Files (x86)\Mozilla Firefox\firefox.exe","","")
#3::ActivateAndOpen("EIS Master Series","C:\eis\EIS\eis.exe","ZHANGX", "seasong312")
;#0::ActivateAndOpen("Outlook","C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE","","")
#0::ActivateAndOpen("Notes","C:\Program Files (x86)\IBM\Lotus\Notes\notes.exe","","")
#q::ActivateAndOpen("PyCharm","C:\Program Files (x86)\JetBrains\PyCharm 5.0\bin\pycharm.exe","","")
#f::ActivateAndOpen("Everything","C:\Program Files (x86)\Everything\Everything.exe","","")
#z::ActivateAndOpen("Zotero","C:\Program Files (x86)\Zotero Standalone\zotero.exe","","")
#x::ActivateAndOpen("XMind","C:\Program Files (x86)\XMind\XMind.exe","","")
#c::ActivateAndOpen("Chrome","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe","","")
#s::ActivateAndOpen("OneNote","C:\Program Files (x86)\Microsoft Office\Office15\ONENOTE.EXE","","")

#t::
	Send, {CTRLDOWN}c{CTRLUP}
	ActivateAndOpen("Firefox","C:\Program Files (x86)\Mozilla Firefox\firefox.exe","","")
	Send, {CTRLDOWN}a{CTRLUP}
	Sleep 200
	Send, {DEL}
	Send, {CTRLDOWN}v{CTRLUP}
return


SendUText(targetTxt)
{
   BlockInput On
   TempClipboard := ClipboardAll
   Clipboard = %targetTxt%
   Send ^v
   Sleep 100
   Clipboard := TempClipboard
   TempClipboard =
   BlockInput Off
   Return
}


;上网认证
#`::
	Run http://webauth.smec-cn.com/
	Sleep 1000
	Send, {F}
	Sleep 200
	Send, {A}
	Sleep 1000
	;SendUText("u2364")
	Sleep 200
	send, {TAB}
	Sleep 200
	;Send	chen2014
	Sleep 500
	Send, {TAB}
	Sleep 500
	Send, {Enter}
return
;注销上网认证
^`::
	Run http://webauth.smec-cn.com/
	Sleep 1000
	Send, {F}
	Sleep 200
	Send, {D}
return

^!p::Pause ;

+h::Send {LEFT}
+j::Send {DOWN}
+k::Send {UP}
+l::Send {RIGHT}

;[字符串映射]
:::mail::zhang_xiao@smec-cn.com
:::sign::张 筱`r-------------------------------`r上海三菱电梯有限公司`r技术中心/产品开发二部/电气开发科`r上海闵行区江川路811号`r021-2408-3133`rzhang_xiao@smec-cn.com
:::a::α
:::A::Α
:::b::β
:::B::Β
:::c::θ
:::C::Θ
:::d::δ
:::D::Δ
:::e::ε
:::E::Ε
:::f::φ
:::F::Φ
:::g::γ
:::G::Γ
:::i::η
:::I::Η
:::m::μ
:::M::Μ
:::p::π
:::P::Π
:::s::σ
:::S::Σ
:::t::τ
:::T::Τ
:::o::ω
:::O::Ω

:::utf::"# -*- coding: utf-8 -*-"



