package define
from ast import ast.*

external macro A(input:Tokens){
    quote(1)
}

external macro B(input:Tokens){
    quote(2)
}

external macro C(attr:Tokens, input:Tokens){
    quote(3)
}

external macro D(attr:Tokens, input:Tokens){
    quote(4)
}