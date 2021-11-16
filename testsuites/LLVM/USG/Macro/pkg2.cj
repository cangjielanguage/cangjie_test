package pkg2

import pkg1.*
from ast import ast.*

external macro Foo1(input: Tokens) : Tokens {
    var a = @M(1 + 2)
    return input
}

external macro Foo2(attr: Tokens, input: Tokens) : Tokens {
    var a = @M(1 + 2)
    return attr + input
}