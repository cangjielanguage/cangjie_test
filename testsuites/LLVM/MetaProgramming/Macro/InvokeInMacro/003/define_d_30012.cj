package D

from ast import ast.*
import B.*
import C.*

external macro d(x:Tokens,y:Tokens){
    var res1 = @b[1](1)
    var res2 = @c0[1](1)
    quote($(res1+res2))
}