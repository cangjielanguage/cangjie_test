package define_10003

from ast import ast.*

external macro X(attr:Tokens, input:Tokens){
    return quote(quote(\$input))
}
