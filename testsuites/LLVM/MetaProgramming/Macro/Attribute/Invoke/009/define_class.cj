package define_class

from ast import ast.*

external macro M(attr:Tokens, input:Tokens){
    return quote(class A{})
}
