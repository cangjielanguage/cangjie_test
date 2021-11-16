package define_10004

from ast import ast.*

external macro X(input:Tokens){
    return quote(quote(\$input))
}
