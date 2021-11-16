package test

from ast import ast.*

external macro M(a:Tokens):Tokens{
    return a
}

external func MetaP_42_M_macro(a:String,b:String,c:String){}
