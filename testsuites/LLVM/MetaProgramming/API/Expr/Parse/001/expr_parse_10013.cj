// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(#"
"#)
    var x =#"\n"#

    let expr = ParseExpr(input)
    if (expr.isLitConstExpr()) {
        print("`${expr.asLitConstExpr().getLiteral().value}`\n")
        print("`${x}`")
        if (expr.asLitConstExpr().getLiteral().value == x) {
            return 0
        }
    }
    return 1
}
