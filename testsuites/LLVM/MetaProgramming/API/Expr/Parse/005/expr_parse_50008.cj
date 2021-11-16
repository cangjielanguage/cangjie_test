// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(if(true){a}else if(false){b}())
    let expr = ParseExpr(input)
    return 0
}
