package test

from ast import ast.*

external var flag = false

external macro M(attr:Tokens,input:Tokens):Tokens{
    return quote(0)
}
