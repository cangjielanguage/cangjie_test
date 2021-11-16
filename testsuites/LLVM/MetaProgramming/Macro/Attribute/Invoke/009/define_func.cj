package define_func

from ast import ast.*

external macro M(attr:Tokens, input:Tokens){
    return quote(func a(){})
}
