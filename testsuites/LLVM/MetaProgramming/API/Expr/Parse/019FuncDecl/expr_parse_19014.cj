// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func bar(b!:A=foo(){=>2}){})
    let expr = ParseFuncDecl(input)
    if (expr.getIdentifier().value != "bar") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "b") {
        return 21
    }
    if (expr.getParamList().getParams()[0].getType().asRefType().getIdentifier().value != "A") {
        return 22
    }
    if (expr.getParamList().getParams()[0].getAssignment().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "foo") {
        return 23
    }
    return 0

}
