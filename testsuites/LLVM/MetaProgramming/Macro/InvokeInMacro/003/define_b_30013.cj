package B

from ast import ast.*
import A.*

external macro b(x:Tokens,y:Tokens){
    var res1 = @a1[1](1)
    var res2 = @a2[1](1)
    quote($(res1+res2))
}
