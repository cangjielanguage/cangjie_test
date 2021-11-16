// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func bar(a:Int32, b!:A, c!:C=C()){})
    let expr = ParseFuncDecl(input)
    if (expr.getIdentifier().value != "bar") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "a") {
        return 21
    }
    if (expr.getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "A") {
        return 22
    }
    if (expr.getParamList().getParams()[2].getAssignment().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "C") {
        return 23
    }
    return 0

}
