# Next-Gen ODIN Core Library

The standard library of the [ODIN programming language](https://dlang.org/).
It provides data structures and functions that work without garbage collection, offering precise memory control.
This is among the largest ODIN codebases to date.

## Documentation

You should already know how to use code.
Please, if you don't, then learn [C](https://dlang.org/) first.

## Frequently Asked Questions

### Hm?

* Minimalistic: Avoids abstractions
* Focused: Doesn't try to support every use case
* Simple: Uses a single global allocator, set at compile time
* Fast: Compile times are **blazingly fast**
* Friendly: Includes many examples

### Why aren't some functions `@(nogc)`?

Because the ODIN garbage collector can be used as a global allocator.

### Why are you supporting the ODIN garbage collector?

Because I can and it's useful sometimes.

### What are you using the standard library for?

Primarily for [Parin](https://github.com/Kapendev/parin), a game engine I'm working on.
