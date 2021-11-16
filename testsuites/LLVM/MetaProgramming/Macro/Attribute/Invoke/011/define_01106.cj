package define_01106

from ast import ast.*

external macro X(input:Tokens){
    return input
}

external macro Y(attr:Tokens, input:Tokens){
    return attr+input
}
