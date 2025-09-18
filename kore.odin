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
import _rl "vendor:raylib"

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
sizeof :: proc "contextless" (x: $T) -> Sz     { return size_of(x) }

// The "to type" functions.
// NOTE: Compiler can print errors that don't make sense when dealing with overload sets.
xxString    :: proc "contextless" (x: Str)           -> string { return transmute(string) x }
xxStr       :: proc "contextless" (x: string)        -> Str { return transmute(Str) x }
xxColor     :: proc "contextless" (x: Rgba)          -> _rl.Color { return transmute(_rl.Color) x }
xxRgba      :: proc "contextless" (x: _rl.Color)     -> Rgba { return transmute(Rgba) x }
xxRectangle :: proc "contextless" (x: Rect)          -> _rl.Rectangle { return transmute(_rl.Rectangle) x }
xxRect      :: proc "contextless" (x: _rl.Rectangle) -> Rect { return transmute(Rect) x }
xx :: proc {
    xxString,
    xxStr,
    xxColor,
    xxRgba,
    xxRectangle,
    xxRect,
}

// NOTE: It's stupid and nice that print functions put a space between items by default.
print   :: _fu.print
println :: _fu.println
echon   :: print
echo    :: println
write   :: print
writeln :: println
puts    :: println

// --- Module: game.d

Update :: proc(float) -> bool
Call   :: proc()

run :: proc (update: Update, color: Rgba = {96, 96, 96, 255}, width: int = 960, height: int = 540, title: string = "Parin") {
    _rl.InitWindow(width, height, cast(cstring) raw_data(title))
    for !_rl.WindowShouldClose() {
        _rl.BeginDrawing()
        _rl.ClearBackground(xx(color))

        dt := _rl.GetFrameTime();
        result := update(dt)

        _rl.EndDrawing()
        if result { break }
    }
    _rl.CloseWindow()
}

mouse :: proc "contextless" () -> Vec2 {
    return _rl.GetTouchPosition(0)
}

drawRect :: proc "contextless" (r: Rect, color: Rgba) {
    _rl.DrawRectanglePro(xx(r), 0, 0, xx(color))
}
draw :: proc {
    drawRect
}

Vec2 :: [2]float

vec2Base :: proc "contextless" (x, y: float) -> Vec2 { return {x, y} }
vec2From :: proc "contextless" (x: float)    -> Vec2 { return {x, x} }
vec2 :: proc {
    vec2Base,
    vec2From,
}

IVec2 :: [2]int

ivec2Base :: proc "contextless" (x, y: int) -> IVec2 { return {x, y} }
ivec2From :: proc "contextless" (x: int)    -> IVec2 { return {x, x} }
ivec2 :: proc {
    ivec2Base,
    ivec2From,
}

Vec3 :: [3]float

vec3Base :: proc "contextless" (x, y, z: float)     -> Vec3 { return {x, y, z} }
vec3From :: proc "contextless" (x: float)           -> Vec3 { return {x, x, x} }
vec3Part :: proc "contextless" (x: float, yz: Vec2) -> Vec3 { return {x, yz.x, yz.y} }
vec3 :: proc {
    vec3Base,
    vec3From,
    vec3Part,
}

IVec3 :: [3]int

ivec3Base :: proc "contextless" (x, y, z: int)      -> IVec3 { return {x, y, z} }
ivec3From :: proc "contextless" (x: int)            -> IVec3 { return {x, x, x} }
ivec3Part :: proc "contextless" (x: int, yz: IVec2) -> IVec3 { return {x, yz.x, yz.y} }
ivec3 :: proc {
    ivec3Base,
    ivec3From,
    ivec3Part,
}

Vec4 :: [4]float

vec4Base :: proc "contextless" (x, y, z, w: float) -> Vec4 { return {x, y, z, w} }
vec4From :: proc "contextless" (x: float)          -> Vec4 { return {x, x, x, x} }
vec4 :: proc {
    vec4Base,
    vec4From,
}

IVec4 :: [4]int

ivec4Base :: proc "contextless" (x, y, z, w: int) -> IVec4 { return {x, y, z, w} }
ivec4From :: proc "contextless" (x: int)          -> IVec4 { return {x, x, x, x} }
ivec4 :: proc {
    ivec4Base,
    ivec4From,
}

Rgba :: [4]ubyte

rgbaBase :: proc "contextless" (r, g, b: ubyte, a: ubyte = 255) -> Rgba { return {r, g, b, a} }
rgbaFrom :: proc "contextless" (r: ubyte)                       -> Rgba { return {r, r, r, r} }
rgba :: proc {
    rgbaBase,
    rgbaFrom,
}

// NOTE: It's using `po` and `si` because of ODIN limitations.
//   * Can't have an alias to a member
//   * Default print functions are too verbose
//   * Printing structures is ugly.
//   * Printing generic structures is ugly.
Rect :: struct {
    po: Vec2,
    si: Vec2,
}

rectBase :: proc "contextless" (po, si: Vec2)          -> Rect { return {po, si} }
rectXywh :: proc "contextless" (x, y, w, h: float)     -> Rect { return {{x, y}, {w, h}} }
rectXys  :: proc "contextless" (x, y: float, si: Vec2) -> Rect { return {{x, y}, si} }
rectPwh  :: proc "contextless" (po: Vec2, w, h: float) -> Rect { return {po, {w, h}} }
rectSize :: proc "contextless" (si: Vec2)              -> Rect { return {{}, si} }
rectWh   :: proc "contextless" (w, h: float)           -> Rect { return {{}, {w, h}} }
rect :: proc {
    rectBase,
    rectXywh,
    rectXys,
    rectPwh,
    rectSize,
    rectWh,
}

IRect :: struct {
    po: IVec2,
    si: IVec2,
}

// NOTE: I don't see a nice way to reuse that code for the int version, so copy-paste it is.
irectBase :: proc "contextless" (po, si: IVec2)        -> IRect { return {po, si} }
irectXywh :: proc "contextless" (x, y, w, h: int)      -> IRect { return {{x, y}, {w, h}} }
irectXys  :: proc "contextless" (x, y: int, si: IVec2) -> IRect { return {{x, y}, si} }
irectPwh  :: proc "contextless" (po: IVec2, w, h: int) -> IRect { return {po, {w, h}} }
irectSize :: proc "contextless" (si: IVec2)            -> IRect { return {{}, si} }
irectWh   :: proc "contextless" (w, h: int)            -> IRect { return {{}, {w, h}} }
irect :: proc {
    irectBase,
    irectXywh,
    irectXys,
    irectPwh,
    irectSize,
    irectWh,
}
