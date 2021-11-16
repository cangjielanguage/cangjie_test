// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is p.B*p.A
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isTupleType()) {
            return 2
        }
        if (tp.asTupleType().getFieldTypes()[0].asQualifiedType().getField().value != "B") {
            return 3
        }
        if (tp.asTupleType().getFieldTypes()[1].asQualifiedType().getField().value != "A") {
            return 4
        }

        return 0
    }
    return 1
}
