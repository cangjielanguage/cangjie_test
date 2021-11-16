// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (?Int64, ??A)->???p.A<Int64>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isFuncType()) {
            return 2
        }
        if (tp.asFuncType().getParamTypes()[0].asOptionType().getComponentType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 3
        }
        if (tp.asFuncType().getParamTypes()[1].asOptionType().getComponentType().asRefType().getIdentifier().value != "A" ) {
            return 4
        }
        if (tp.asFuncType().getRetType().asOptionType().getComponentType().asQualifiedType().getField().value != "A" ) {
            return 5
        }
        return 0
    }
    return 1
}
