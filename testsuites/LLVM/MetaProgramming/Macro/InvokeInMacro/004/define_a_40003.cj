package A

from ast import ast.*

external macro a(x:Tokens, y:Tokens){
    quote(0)
}

external var i = @a[0](1)
