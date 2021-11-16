// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {} catch(e: RunTime | Int64) {} finally {}
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var pattern = expr.asTryExpr().getCatchPatterns()[0]
        if (!pattern.isExceptTypePattern()) {
            return 2
        }
        if (pattern.asExceptTypePattern().getPattern().asVarPattern().getVarDecl().getIdentifier().value != "e"){
            return 3
        }
        if (pattern.asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (pattern.asExceptTypePattern().getTypes()[1].asPrimitiveType().getPrimitive().value != "Int64"){
            return 5
        }
        return 0
    }
    return 1
}
