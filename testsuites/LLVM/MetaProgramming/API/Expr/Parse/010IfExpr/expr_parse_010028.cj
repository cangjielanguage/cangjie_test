// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (false) {
             func foo(){}
        } else {
             func bar(){}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 1
        }
        if (b.getIfBody()[0].asDecl().asFuncDecl().getBody().size() != 0) {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asDecl().asFuncDecl().getIdentifier().value != "bar") {
            return 3
        }

        return 0
    }
    return 4
}
