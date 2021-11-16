// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.conf
// EXEC: %compiler %cmp_opt  %f %use_ast -o %output
// EXEC: %run %run_opt %output %run_args

import ast.*

func test():Option<Int64>{
    var x : ?Tokens = quote(a)
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
