package return_one
from ast import ast.*

external macro VAR_A(input:Tokens){
    return quote(1)
}

external macro VAR_B(input:Tokens){
    return quote(1)
}

external macro VAR_C(attr:Tokens, input:Tokens){
    return quote(1)
}

external macro VAR_D(attr:Tokens, input:Tokens){
    return quote(1)
}
