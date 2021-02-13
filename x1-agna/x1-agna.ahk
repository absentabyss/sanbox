F7::Suspend

; First layer.
*`::Return
*1::Return
*2::Home
*3::End
*4::Return
*5::Esc
*6::Return
*7::PgUp
*8::PgDn
*9::Return
*0::Return
*-::Return
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

*Capslock::Return
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
*RShift::CapsLock

*RCtrl::Shift

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
