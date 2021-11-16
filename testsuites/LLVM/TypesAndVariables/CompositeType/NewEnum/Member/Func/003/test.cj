package test

import ast.*

external macro M(a:Tokens):Tokens{
    return a
}

external macro M2(a:Tokens,b:Tokens):Tokens{
    return b
}
