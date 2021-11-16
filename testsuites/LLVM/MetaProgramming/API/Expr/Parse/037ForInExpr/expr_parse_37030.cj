// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         for (item in list) if (c) {}
    )
    let forExpr = ParseForInExpr(input)
    if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "item") {
        return 2
    }
    if (forExpr.getInExpr().asRefExpr().getIdentifier().value != "list") {
        return 3
    }
    if (!forExpr.hasPatternGuard()){
        return 5
    }
    if (forExpr.getPatternGuard().asRefExpr().getIdentifier().value != "c") {
        return 6
    }
    if (forExpr.getBody().size() != 0) {
        return 7
    }

    return 0
}
