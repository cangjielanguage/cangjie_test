package A

from ast import ast.*

external macro a1(x:Tokens){
    @a2(1)
    quote(0)
}

external macro a2(x:Tokens){
    @a1(1)
    quote(0)
}