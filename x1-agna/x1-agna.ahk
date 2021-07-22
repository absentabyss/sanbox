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
*8::Home
*9::End
*0::Return
*-::CapsLock
*=::Return
*Backspace::Return

*q::k
*w::y
*e::o
*r::'
*t::!
*y::f
*u::c
*i::l
*o::p
*p::q
*[::z
*]::Del
*\::Return

*Capslock::Send {U+00A3}
*a::h
*s::i
*d::e
*f::a
*g::u
*h::d
*j::s
*k::t
*l::n
*;::r
*'::v

*LShift::Backspace
*z::j
*x::?
*c::0
*v::2
*b::#
*n::w
*m::g
*,::m
*.::b
*/::x
*RShift::LAlt

*LAlt::Shift
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
RAlt & y::Send 3
RAlt & u::Send /
RAlt & i::Send 1
RAlt & o::Send *
RAlt & p::Send ``
RAlt & [::Send ~

RAlt & a::Send -
RAlt & s::Send (
RAlt & d::Send .
RAlt & f::Send "
RAlt & g::Send <
RAlt & h::Send >
RAlt & j::Send `=
RAlt & k::Send `,
RAlt & l::Send `;
RAlt & `;::Send )
RAlt & '::Send ]

RAlt & z::Send 8
RAlt & x::Send 4
RAlt & c::Send {{}
RAlt & v::Send {}}
RAlt & b::Send 6
RAlt & n::Send `%
RAlt & m::Send {+}
RAlt & ,::Send 5
RAlt & .::Send 9
RAlt & /::Send 7

RAlt & Space::Send {Enter}

; Custom bindings.
LWin & Esc::!F4
LWin & F1::Send {Volume_Mute}
LWin & F2::Send {Volume_Down}
LWin & F3::Send {Volume_Up}
LWin & F4::Send {Media_Prev}
LWin & F5::Send {Media_Play_Pause}
LWin & F6::Send {Media_Next}