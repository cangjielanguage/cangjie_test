// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing Error in ParseExpr



from ast import ast.*

func main() {
   	var input : Tokens = quote(a=b + c=d)
    let expr = ParseExpr(input)
    if (expr.isBinaryExpr()) {
        var b = expr.asBinaryExpr()
        if (b.getLeftExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getLeftExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (b.getRightExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "c") {
            return 3
        }
        if (b.getRightExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value != "d") {
            return 4
        }
        return 1
    }
    return 0
}
