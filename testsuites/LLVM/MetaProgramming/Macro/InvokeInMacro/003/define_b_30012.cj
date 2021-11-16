package B

from ast import ast.*
import A.*

external macro b(x:Tokens,y:Tokens){
    var res = @a1[1](1)
    quote($res)
}
