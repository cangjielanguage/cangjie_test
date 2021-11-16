package define_01104

from ast import ast.*

external macro M(input:Tokens){
    return input
}

external macro M(attr:Tokens, input:Tokens){
    return attr+input
}
