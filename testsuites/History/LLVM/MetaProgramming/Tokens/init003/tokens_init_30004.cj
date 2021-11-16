// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.cfg
// EXEC: %compiler -i ast.cfg  %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

import ast.*

func check(T:Tokens): Int64{
    if (T.size() != 2) {
        return 1
    }
    var t1 = match (T.get(0)) {
        case tok: Token => 1
        case _ => 0
    }
    if (t1 != 0) {
        return 2
    }
    var t2 = match (T.get(1)) {
        case tok: Token => 0
        case _ => 1
    }
    if (t2 != 0) {
        return 3
    }
    return 0
}


func main(){
    var t : Option<Token>[] =  @{None<Token>,Some(Token())}
    var T1 = Tokens(t)
    var res1 = check(T1)
    if (res1 != 0) {return res1}
    return 0
}
