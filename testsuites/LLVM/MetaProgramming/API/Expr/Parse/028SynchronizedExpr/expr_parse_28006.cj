// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {
            var a:Int32 = 1
            a++
            a+b;
            -b;4
        }
    )
    let expr = ParseExpr(input)
    if (expr.isSynchronizedExpr()) {
        var b = expr.asSynchronizedExpr()
        if (b.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
            return 1
        }
        if (b.getBody()[0].asDecl().asVarDecl().getIdentifier().value != "a" ) {
            return 2
        }
        if (b.getBody()[1].asExpr().asIncOrDecExpr().getExpr().asRefExpr().getIdentifier().value != "a" ) {
            return 3
        }
        if (b.getBody()[2].asExpr().asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value != "b" ) {
            return 4
        }
        if (b.getBody()[3].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b" ) {
            return 5
        }
        if (b.getBody()[4].asExpr().asLitConstExpr().getLiteral().value != "4" ) {
            return 6
        }
        return 0
    }
    return 8
}
