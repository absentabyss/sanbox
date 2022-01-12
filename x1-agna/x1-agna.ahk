#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F7::Suspend

; First layer.
*`::Return
*1::Esc
*2::PgUp
*3::PgDn
*4::Return
*5::Return
*6::Return
*7::Return
*8::Return
*9::Home
*0::End
*-::Return
*=::CapsLock
*Backspace::Return

*q::k
*w::y
*e::o
*r::'
*t::!
*y::Return
*u::f
*i::c
*o::l
*p::p
*[::q
*]::z
*\::Del

*Capslock::Send {U+00A3}
*a::h
*s::i
*d::e
*f::a
*g::u
*h::Enter
*j::d
*k::s
*l::t
*;::n
*'::r
*Enter::v

*RShift::Backspace
*z::j
*x::?
*c::0
*v::2
*b::#
*n::LAlt
*m::w
*,::g
*.::m
*/::b
*LAlt::x

*RWin::Return
*RCtrl::Return

; Second layer.
+r::Send {U+00AC}
+t::@

+x::|
+c::Send \
+v::^
+b::Send {U+00A9}

; Third layer.
RAlt & q::Send [
RAlt & w::Send $
RAlt & e::Send :
RAlt & r::Send _
RAlt & t::Send &
RAlt & u::Send 3
RAlt & i::Send /
RAlt & o::Send 1
RAlt & p::Send *
RAlt & [::Send ``
RAlt & ]::Send ~

RAlt & a::Send -
RAlt & s::Send (
RAlt & d::Send .
RAlt & f::Send "
RAlt & g::Send <
RAlt & j::Send >
RAlt & k::Send `=
RAlt & l::Send `,
RAlt & `;::Send `;
RAlt & '::Send )
RAlt & Enter::Send ]

RAlt & z::Send 8
RAlt & x::Send 4
RAlt & c::Send {{}
RAlt & v::Send {}}
RAlt & b::Send 6
RAlt & m::Send `%
RAlt & ,::Send {+}
RAlt & .::Send 5
RAlt & /::Send 9
RAlt & LAlt::Send 7

RAlt & Space::Send {Enter}

; Custom bindings.
LWin & Esc::!F4
LWin & F1::Send {Volume_Mute}
LWin & F2::Send {Volume_Down}
LWin & F3::Send {Volume_Up}
LWin & F4::Send {Media_Prev}
LWin & F5::Send {Media_Play_Pause}
LWin & F6::Send {Media_Next}