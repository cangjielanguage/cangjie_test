package test

from ast import ast.*

external var flag = false

external macro M(a:Tokens):Tokens{
    return quote(flag = true)
}
