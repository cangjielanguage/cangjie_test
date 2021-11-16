// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote({=>1}..{=>a}:{=>b})
    let expr = ParseRangeExpr(input)
    return 0
}
