package define_01109

from ast import ast.*

external macro M(attr:Tokens, input:Tokens){
    return attr+input
}

var x = M
