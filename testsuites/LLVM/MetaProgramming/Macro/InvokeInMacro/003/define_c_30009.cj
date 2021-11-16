package C

from ast import ast.*
import A.*

external macro c0(x:Tokens,y:Tokens){
    var res = @a[1](1)
    quote($res)
}
