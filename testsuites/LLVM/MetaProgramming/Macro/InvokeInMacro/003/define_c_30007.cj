package C

from ast import ast.*
import B.*

external macro c1(x:Tokens,y:Tokens){
    var res = @b1[1](1)
    quote($res)
}

external macro c2(x:Tokens,y:Tokens){
    var res = @b2[1](1)
    quote($res)
}