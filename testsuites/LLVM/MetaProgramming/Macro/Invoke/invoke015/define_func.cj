package define_func
from ast import ast.*

external macro VAR_A(input:Tokens){
    return quote(func a(){1})
}

external macro VAR_B(input:Tokens){
    return quote(func b(){1})
}

external macro VAR_C(attr:Tokens, input:Tokens){
    return quote(func c(){1})
}

external macro VAR_D(attr:Tokens, input:Tokens){
    return quote(func d(){1})
}
