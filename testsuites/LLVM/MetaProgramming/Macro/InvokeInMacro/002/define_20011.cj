package define_20011

from ast import ast.*

external macro X(attr:Tokens, input:Tokens){
    return quote(quote(\$input))
}
