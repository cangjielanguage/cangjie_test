package define_20021

from ast import ast.*

external macro X(attr:Tokens, input:Tokens){
    return quote(quote(\$input))
}
