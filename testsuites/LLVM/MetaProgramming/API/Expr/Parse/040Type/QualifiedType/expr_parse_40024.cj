// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is pkgs.A
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isQualifiedType()) {
            return 2
        }
        if (tp.asQualifiedType().getBaseType().asRefType().getIdentifier().value != "pkgs") {
            return 3
        }
        if (tp.asQualifiedType().getField().value != "A") {
            return 4
        }
        if (tp.asQualifiedType().isInstantiation()){
            return 5
        }
        return 0
    }
    return 1
}
