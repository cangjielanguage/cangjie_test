package define_record

from ast import ast.*

external macro M(attr:Tokens, input:Tokens){
    return quote(record A{})
}
