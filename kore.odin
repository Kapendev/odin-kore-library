// ---
// Copyright 2025 Alexandros F. G. Kapretsos
// SPDX-License-Identifier: MIT
// Email: alexandroskapretsos@gmail.com
// Project: https://github.com/Kapendev/joka
// ---

/// Single file header library for the C programming language.
/// Make sure to change the header name before using~

package app

import _bs "base:builtin"
import _fu "core:fmt"

size_t    :: _bs.uint
ptrdiff_t :: _bs.int
byte      :: i8
short     :: i16
int       :: i32
long      :: i64
ubyte     :: u8
ushort    :: u16
uint      :: u32
ulong     :: u64
float     :: f32
double    :: f64
char      :: ubyte
wchar     :: ushort
dchar     :: uint

Sz     :: size_t
Pd     :: ptrdiff_t
Str    :: []char
Str16  :: []wchar
Str64  :: []dchar
CStr   :: ^char
CStr16 :: ^wchar
CStr32 :: ^dchar

typeof :: proc "contextless" (x: $T) -> typeid { return typeid_of(type_of(x)); }

ssfrom :: proc "contextless" (x: string) -> Str { return transmute(Str) x }
ss :: proc {
    ssfrom,
}

xxstring :: proc "contextless" (x: Str) -> string { return transmute(string) x }
xx :: proc {
    xxstring,
}

echon :: _fu.print
echo  :: _fu.println
