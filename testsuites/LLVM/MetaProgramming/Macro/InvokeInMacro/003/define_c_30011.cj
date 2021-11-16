package C

from ast import ast.*
import A.*

external macro c1(x:Tokens,y:Tokens){
    var res = @a1[1](1)
    quote($res)
}

external macro c2(x:Tokens,y:Tokens){
    var res = @a2[1](1)
    quote($res)
}
