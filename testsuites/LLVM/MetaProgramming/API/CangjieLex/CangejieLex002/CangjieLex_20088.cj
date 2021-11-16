// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var i = "```"
    var a : Tokens = CangjieLex(i)

    var b : Tokens = CangjieLex("`11")
    b.dump()
    var c : Tokens = CangjieLex("`1")
    print("=====\n")
    c.dump()
    return 0
}

