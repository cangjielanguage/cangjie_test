// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (Array<Int64>, Array<Array<Int64>>)-> Array<A>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isFuncType()) {
            return 2
        }
        if (tp.asFuncType().getParamTypes()[0].asArrayType().getComponentType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 3
        }
        if (tp.asFuncType().getParamTypes()[1].asArrayType().getDims() != Int32(2) ) {
            return 4
        }
        if (tp.asFuncType().getRetType().asArrayType().getComponentType().asRefType().getIdentifier().value != "A" ) {
            return 5
        }
        return 0
    }
    return 1
}
