package D

from ast import ast.*
import C.*

external macro d1(x:Tokens,y:Tokens){
    var res = @c1[0](1)
    quote($res)
}

external macro d2(x:Tokens,y:Tokens){
    var res = @c2[0](1)
    quote($res)
}