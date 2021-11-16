// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while ({a:Int32=>b}){ {c:Int32 => d} })
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "a") {
            return 1
        }
        if (b.getBody()[0].asExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "d") {
            return 3
        }
        return 0
    }
    return 10
}
