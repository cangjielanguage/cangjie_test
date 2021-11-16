// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(-if (true){})
    let expr = ParseExpr(input)
    if (expr.isUnaryExpr()) {
        var b = expr.asUnaryExpr()
        if (b.getExpr().isIfExpr()) {
            return 0
        }
        return 1
    }
    return 3
}
