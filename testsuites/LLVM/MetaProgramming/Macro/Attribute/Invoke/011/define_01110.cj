package define_01110

from ast import ast.*

external macro Y(attr:Tokens, input:Tokens){
    return attr+input
}

external macro M(attr:Tokens, input:Tokens){
    return attr+input
}

func test(){
    M = Y
}