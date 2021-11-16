// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.cfg
// EXEC: %compiler -i ast.cfg  %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

import ast.*

func check(T:Tokens): Int64{
    var t = match (T.get(0)) {
        case tok: Token => 1
        case _ => 0
    }
    return t
}

func main(){
    var t : Option<Token>[] =  Option<Token>[](0,None<Token>)
    var T1 = Tokens(t)
    var res1 = check(T1)
    if (res1 != 0) {return res1}
    return 0
}
