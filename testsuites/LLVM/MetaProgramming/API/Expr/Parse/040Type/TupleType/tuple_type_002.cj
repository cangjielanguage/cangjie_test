// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is B*String
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isTupleType()) {
            return 2
        }
        if (tp.asTupleType().getFieldTypes()[0].asRefType().getIdentifier().value != "B") {
            return 3
        }
        if (tp.asTupleType().getFieldTypes()[1].asRefType().getIdentifier().value != "String") {
            return 4
        }
        return 0
    }
    return 1
}
