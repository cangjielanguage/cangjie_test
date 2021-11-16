package E

from ast import ast.*
import A.*
import B.*
import C.*
import D.*

external macro e1(x:Tokens,y:Tokens){
    var res1 = @a1[0](1)
    var res2 = @b1[0](1)
    var res3 = @c1[0](1)
    var res4 = @d1[0](1)
    quote($(res1+res2+res3+res4))
}

external macro e2(x:Tokens,y:Tokens){
    var res1 = @a2[0](1)
    var res2 = @b2[0](1)
    var res3 = @c2[0](1)
    var res4 = @d2[0](1)
    quote($(res1+res2+res3+res4))
}