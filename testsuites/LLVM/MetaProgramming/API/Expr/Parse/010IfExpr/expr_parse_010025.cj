// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (false) {
             start..stop:step
        } else {
             0..10:step
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 1
        }
        if (b.getIfBody()[0].asExpr().asRangeExpr().getStartExpr().asRefExpr().getIdentifier().value != "start") {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRangeExpr().getStepExpr().asRefExpr().getIdentifier().value != "step") {
            return 3
        }

        return 0
    }
    return 4
}
