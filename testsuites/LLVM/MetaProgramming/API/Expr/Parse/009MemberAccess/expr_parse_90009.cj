// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(if(true){a}else{b}.b)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getField().value != "b") {
            return 2
        }
        return 0
    }
    return 3
}
