// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is Array<A>*Array<Array<Int64>>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isTupleType()) {
            return 2
        }
        if (tp.asTupleType().getFieldTypes()[0].asArrayType().getDims() != Int32(1)) {
            return 3
        }
        if (tp.asTupleType().getFieldTypes()[1].asArrayType().getDims() != Int32(2)) {
            return 4
        }

        return 0
    }
    return 1
}
