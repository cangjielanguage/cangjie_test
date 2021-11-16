// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.conf
// EXEC: %compiler %cmp_opt  %f %use_ast -o %output
// EXEC: %run %run_opt %output %run_args

import ast.*

func test():Result<Int64>{
    Ok(quote(a))??quote(a)
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
