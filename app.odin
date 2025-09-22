package app

// You.
main :: proc() {
    run(update)
    test()
}

// Are.
update :: proc(dt: float) -> bool {
    draw(rect(mouse(), 64, mouse().y / 2), rgba(200, 200, 100))
    return false
}

// Cute.
test :: proc() {
    a := xx("Hi there.")
    echo(xx(a), a)
    echo("a:", typeof(a))

    b := int(69)
    echo("b:", typeof(b))

    c := vec2(42, 0)
    echo(rect(c.x, c.y, 16, 16))
    echo(rect(c.x, c.y, vec2(16)))
    echo(rect(c, vec2(16)))
}
