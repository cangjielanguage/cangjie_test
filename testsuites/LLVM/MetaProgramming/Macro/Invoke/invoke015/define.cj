package define
from ast import ast.*

external macro VAR_A(input:Tokens){
    return quote(var a : Int64 = 1)
}

external macro VAR_B(input:Tokens){
    return quote(var b : Int64 = 1)
}

external macro VAR_C(attr:Tokens, input:Tokens){
    return quote(var c : Int64 = 1)
}

external macro VAR_D(attr:Tokens, input:Tokens){
    return quote(var d : Int64 = 1)
}
