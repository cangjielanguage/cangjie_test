package D

from ast import ast.*
import B.*
import C.*

external macro d(x:Tokens,y:Tokens){
    var res1 = @b1[1](1)
    var res2 = @b2[1](1)
    var res3 = @c1[1](1)
    var res4 = @c2[1](1)
    quote($(res1+res2+res3+res4))
}