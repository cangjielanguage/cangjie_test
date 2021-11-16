package E

from ast import ast.*
import A.*
import B.*
import C.*
import D.*

external macro e(x:Tokens,y:Tokens){
    var res1 = @a[0](1)
    var res2 = @b[0](1)
    var res3 = @c0[0](1)
    var res4 = @d[0](1)
    quote($(res1+res2+res3+res4))
}