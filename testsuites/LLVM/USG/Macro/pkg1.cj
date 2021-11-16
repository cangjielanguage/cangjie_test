package pkg1

from ast import ast.*

external macro M(input: Tokens) : Tokens {
    return input
}

external macro Foo(input: Tokens) : Tokens {
    return input
}

external macro Bar(input: Tokens) : Tokens {
    return input
}

external macro AddToMul(input: Tokens) : Tokens {
    quote($input * 2)
}