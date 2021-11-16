package define
from ast import ast.*

external macro X(input:Tokens){
    input + quote(+1)
}

external macro Y(input:Tokens){
    input + quote(+1)
}