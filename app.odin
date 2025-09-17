package app

main :: proc() {
    a := ss("Hi there.")
    echo(xx(a), a)
    echo("a ->", typeof(a))
    
    b: int = 69
    echo("b ->", typeof(b))
}
