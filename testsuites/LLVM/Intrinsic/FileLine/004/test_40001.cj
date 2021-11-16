package test

from ast import ast.*

external var flag = false

external macro M(a:Tokens):Tokens{
    var x = sourceFile()
    var y = sourceLine()
    print("${x} ${y}")
    return a
}
