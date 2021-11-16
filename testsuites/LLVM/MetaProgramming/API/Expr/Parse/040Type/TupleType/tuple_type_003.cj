// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is ??T * ????V
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isTupleType()) {
            return 2
        }
        if (tp.asTupleType().getFieldTypes()[0].asOptionType().getComponentType().asRefType().getIdentifier().value != "T") {
            return 3
        }
        if (tp.asTupleType().getFieldTypes()[1].asOptionType().getComponentType().asRefType().getIdentifier().value != "V") {
            return 3
        }

        return 0
    }
    return 1
}
