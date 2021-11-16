// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {
            if (a) {
                b
            } else {
                c
            }
        }
    )
    let expr = ParseExpr(input)
    if (expr.isSynchronizedExpr()) {
        var b = expr.asSynchronizedExpr()
        if (b.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
            return 1
        }
        if (b.getBody()[0].asExpr().asIfExpr().getCondExpr().asRefExpr().getIdentifier().value != "a" ) {
            return 2
        }
        if (b.getBody()[0].asExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b" ) {
            return 3
        }
        if (b.getBody()[0].asExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c" ) {
            return 4
        }
        return 0
    }
    return 5
}
