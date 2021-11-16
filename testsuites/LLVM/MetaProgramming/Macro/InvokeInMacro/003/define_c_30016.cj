package C

from ast import ast.*
import A.*
import B.*

external macro c1(x:Tokens,y:Tokens){
    var res1 = @a1[0](1)
    var res2 = @b1[0](1)
    quote($(res1+res2))
}

external macro c2(x:Tokens,y:Tokens){
    var res1 = @a2[0](1)
    var res2 = @b2[0](1)
    quote($(res1+res2))
}
