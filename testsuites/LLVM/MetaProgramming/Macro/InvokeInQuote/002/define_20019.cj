package define_20019

from ast import ast.*

external macro X(attr:Tokens,input:Tokens){
    return attr + quote(-) + input
}

external macro Y(attr:Tokens,input:Tokens){
    return attr + quote(+) + input
}