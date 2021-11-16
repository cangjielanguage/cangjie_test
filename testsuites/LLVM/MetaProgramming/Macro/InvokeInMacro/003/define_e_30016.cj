package E

from ast import ast.*
import C.*
import D.*

external macro e1(x:Tokens,y:Tokens){
    var res1 = @c1[0](1)
    var res2 = @d1[0](1)
    quote($(res1+res2))
}

external macro e2(x:Tokens,y:Tokens){
    var res1 = @c2[0](1)
    var res2 = @d2[0](1)
    quote($(res1+res2))
}