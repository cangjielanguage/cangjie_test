package define
from ast import ast.*

external macro M(input:Tokens){
    print("hello macro")
    input + quote(+) + input
}