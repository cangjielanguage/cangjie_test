// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(if (true){}+if (false){})
    let expr = ParseExpr(input)
    if (expr.isBinaryExpr()) {
        var b = expr.asBinaryExpr()
        if (b.getLeftExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getRightExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 2
        }
        return 0
    }
    return 3
}
