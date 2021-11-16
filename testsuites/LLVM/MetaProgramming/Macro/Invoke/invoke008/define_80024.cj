package define
from ast import ast.*

external macro X(attr:Tokens,input:Tokens){
    input + attr
}

external macro Y(input:Tokens){
    input + quote(+1)
}