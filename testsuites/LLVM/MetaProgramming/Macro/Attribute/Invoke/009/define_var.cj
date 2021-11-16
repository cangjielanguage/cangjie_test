package define_var

from ast import ast.*

external macro M(attr:Tokens, input:Tokens){
    return quote(var a = 1)
}
