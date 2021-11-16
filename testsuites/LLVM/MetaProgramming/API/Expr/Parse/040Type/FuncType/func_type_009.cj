// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is ((((M7_<I1_>)->G1_))->(G2_*G3_), (((M7_<I1_>)->G1.A<Int64>))->(G2_*G3_), (((M7_<I1_>)->Int64))->(G2_*G3_))-> (((M7_<I1_>)->G1_))->(G2_*G3_)
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isFuncType()) {
            return 2
        }
        if (tp.asFuncType().getParamTypes()[0].asFuncType().getParamTypes()[0].asParenType().getType().asFuncType().getParamTypes()[0].asRefType().getArgs()[0].asRefType().getIdentifier().value != "I1_") {
            return 3
        }
        if (tp.asFuncType().getParamTypes()[1].asFuncType().getParamTypes()[0].asParenType().getType().asFuncType().getRetType().asQualifiedType().getField().value != "A" ) {
            return 4
        }
        if (tp.asFuncType().getParamTypes()[2].asFuncType().getParamTypes()[0].asParenType().getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64" ) {
            return 4
        }
        if (tp.asFuncType().getRetType().asFuncType().getRetType().asParenType().getType().asTupleType().getFieldTypes()[0].asRefType().getIdentifier().value != "G2_" ) {
            return 5
        }
        return 0
    }
    return 1
}
