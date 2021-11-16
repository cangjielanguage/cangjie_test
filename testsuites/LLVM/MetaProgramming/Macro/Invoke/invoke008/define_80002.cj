package define
from ast import ast.*

external macro X(input:Tokens){
    input + quote(+) + input
}

external macro Y(input:Tokens){
    input + quote(+2)
}