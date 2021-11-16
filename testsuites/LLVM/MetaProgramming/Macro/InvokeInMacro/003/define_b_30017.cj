package B

import A.*
from ast import ast.*

external macro b1(x:Tokens,y:Tokens){
    var res = @a1[1](0)
    quote($res)
}

external macro b2(x:Tokens,y:Tokens){
    var res = @a2[1](0)
    quote($res)
}