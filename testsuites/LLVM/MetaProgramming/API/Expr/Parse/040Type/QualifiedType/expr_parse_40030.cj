// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is A.B<?In64>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isQualifiedType()) {
            return 2
        }
        if (tp.asQualifiedType().getBaseType().asRefType().getIdentifier().value != "A") {
            return 3
        }
        if (tp.asQualifiedType().getField().value != "B") {
            return 4
        }
        if (!tp.asQualifiedType().isInstantiation()){
            return 5
        }
        if (tp.asQualifiedType().getTypeArguments()[0].asOptionType().getQuestNum() != Int32(1) ) {
            return 6
        }
        return 0
    }
    return 1
}
