// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var i = """
    match (1) {
     case x : Int64 => 1
     case None(Int64) => 2
     case a => 3
     case _ if ((true)) => 4
     }"""
    var a : Tokens = CangjieLex(i)
    return check(a+Token(152), a)
}

