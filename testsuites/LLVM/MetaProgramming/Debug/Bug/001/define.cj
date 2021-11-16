package define
from ast import ast.*

external macro VAR_A(input:Tokens){
    return quote(var a : Int64 = 1)
}

external macro VAR_B(attr:Tokens, input:Tokens){
    return quote(var b : Int64 = 1)
}

external macro SAME(input:Tokens){
    return input
}

external macro SAME(attr:Tokens, input:Tokens){
    return input
}

//    var a : String = "${@SAME[0]{i:Int64=>i}(0)}"  // ->  "" +  ({i:Int64=>i}(0)).toString()