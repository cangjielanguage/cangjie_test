package define_20001

from ast import ast.*

external macro X(attr:Tokens, input:Tokens){
    return quote(quote(\$input))
}
