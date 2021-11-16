package define
from ast import ast.*

var x = 1
var y = 1

external macro A(input:Tokens){
    if (x < 2) {
        x = x + 1
        return quote(0)
    }
    return quote(1)
}

external macro B(input:Tokens){
    if (x < 2) {
        x = x + 1
        return quote(\@A(1))
    }
    return quote(0)
}

external macro C(attr:Tokens, input:Tokens){
    if (y < 2) {
        y = y + 1
        return quote(0)
    }
    return quote(1)
}

external macro D(attr:Tokens, input:Tokens){
    if (y < 2) {
        y = y + 1
        return quote(\@C[0](1))
    }
    return quote(1)
}
