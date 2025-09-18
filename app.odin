package app

main :: proc() {
    a := ss("Hi there.")
    echo(xx(a), a)
    echo("a:", typeof(a))

    b := int(69)
    echo("b:", typeof(b))

    c := vec2(42, 0)
    echo(rect(c.x, c.y, 16, 16))
    echo(rect(c.x, c.y, vec2(16)))
    echo(rect(c, vec2(16)))
}
