// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (false) {
            Int32(a)
        } else {
            Int64(b)
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 1
        }
        if (b.getIfBody()[0].asExpr().asNumTypeConvExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asNumTypeConvExpr().getType().getPrimitive().value != "Int64") {
            return 3
        }

        return 0
    }
    return 4
}
