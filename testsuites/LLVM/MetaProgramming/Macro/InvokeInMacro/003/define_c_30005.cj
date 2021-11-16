package C

from ast import ast.*
import B.*

external macro c1(x:Tokens,y:Tokens){
    var res1 = @b1[1](1)
    var res2 = @b2[1](1)
    quote($(res1+res2))
}
