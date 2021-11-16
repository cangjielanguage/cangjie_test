// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {}
    )
    let expr = ParseSynchronizedExpr(input)
    if (expr.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
        return 1
    }
    if (expr.getBody().size() !=0 ) {
        return 2
    }
    return 0
}
