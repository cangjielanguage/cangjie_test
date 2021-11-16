// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {
            ();(1,2,3);[4,5,6];\@{a,b}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isSynchronizedExpr()) {
        var b = expr.asSynchronizedExpr()
        if (b.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
            return 1
        }
        if (!b.getBody()[0].asExpr().isUnitExpr()) {
            return 2
        }
        if (b.getBody()[1].asExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 3
        }
        if (b.getBody()[2].asExpr().asListLit().getChildren()[1].asLitConstExpr().getLiteral().value != "5") {
            return 3
        }
        if (b.getBody()[3].asExpr().asArrayLit().getChildren()[1].asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        return 0
    }
    return 5
}
