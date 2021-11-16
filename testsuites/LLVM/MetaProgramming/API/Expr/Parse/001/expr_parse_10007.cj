// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(0o0)
    let expr = ParseExpr(input)
    if (expr.isLitConstExpr()) {
        if (expr.asLitConstExpr().getLiteral().value == "0o0") {
            return 0
        }
        print("${expr.asLitConstExpr().getLiteral().value}")
    }
    return 1
}
