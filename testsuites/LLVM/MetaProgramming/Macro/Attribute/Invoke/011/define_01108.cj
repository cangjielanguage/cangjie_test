package define_01108

from ast import ast.*

external macro Y(attr:Tokens, input:Tokens){
    return attr+input
}

external macro M(attr:Tokens, input:Tokens){
    var a = Y
    return attr+input
}
