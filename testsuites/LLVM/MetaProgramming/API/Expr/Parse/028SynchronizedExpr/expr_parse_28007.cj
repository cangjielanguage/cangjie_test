// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {
            a is b;
            b as A
        }
    )
    let expr = ParseExpr(input)
    if (expr.isSynchronizedExpr()) {
        var b = expr.asSynchronizedExpr()
        if (b.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
            return 1
        }
        if (b.getBody()[0].asExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a" ) {
            return 2
        }
        if (b.getBody()[1].asExpr().asAsExpr().getType().asRefType().getIdentifier().value != "A" ) {
            return 3
        }
        return 0
    }
    return 4
}
