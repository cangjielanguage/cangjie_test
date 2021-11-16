package define_10001

from ast import ast.*

external macro X(input:Tokens){
    return quote(quote(\$input))
}
