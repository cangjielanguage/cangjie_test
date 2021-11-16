package B

from ast import ast.*
import A.*

external macro b1(x:Tokens,y:Tokens){
    var res = @a[1](1)
    quote($res)
}

external macro b2(x:Tokens,y:Tokens){
    var res = @a[1](1)
    quote($res)
}
