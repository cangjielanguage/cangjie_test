package define
from ast import ast.*

external macro X(input:Tokens){
    input + quote(+1)
}

external macro Y(attr:Tokens,input:Tokens){
    attr + input
}