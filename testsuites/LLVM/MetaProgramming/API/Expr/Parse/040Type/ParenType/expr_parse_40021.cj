// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (PKG.A<String>)
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isParenType()) {
            return 2
        }
        if (tp.asParenType().getType().asQualifiedType().getTypeArguments()[0].asRefType().getIdentifier().value != "String") {
            return 3
        }
        return 0
    }
    return 1
}
