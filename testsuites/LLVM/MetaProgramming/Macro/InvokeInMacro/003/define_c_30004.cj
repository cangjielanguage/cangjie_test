package C

from ast import ast.*
import B.*

external macro c1(x:Tokens,y:Tokens){
    var res = @b[1](1)
    quote($res)
}
