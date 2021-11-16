package test20047

from ast import ast.*

external macro test(input:Tokens){
    return quote(quote(input))
}