package B

from ast import ast.*
import A.*

external macro b1(x:Tokens,y:Tokens){
    var res = @a1[1](1)
    quote($res)
}

external macro b2(x:Tokens,y:Tokens){
    var res = @a2[1](1)
    quote($res)
}