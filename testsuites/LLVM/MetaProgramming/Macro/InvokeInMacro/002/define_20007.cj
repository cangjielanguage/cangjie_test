package define_20007

from ast import ast.*

external macro X(attr:Tokens, input:Tokens){
    return quote(quote(\$input))
}
