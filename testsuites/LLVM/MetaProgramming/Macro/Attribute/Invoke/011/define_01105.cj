package define_01105

from ast import ast.*

external macro X(input:Tokens){
    X = Y
    return input
}

external macro Y(attr:Tokens, input:Tokens){
    Y = X
    return attr+input
}
