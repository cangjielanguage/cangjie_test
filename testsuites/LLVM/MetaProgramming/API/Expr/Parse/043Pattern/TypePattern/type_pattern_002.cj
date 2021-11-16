// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case a:((M7_<I1_>)->G1_)->(G2_*G3_) if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isTypePattern()) {
            return 6
        }
        if (pattern.asTypePattern().getPattern().asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 7
        }
        var tp = pattern.asTypePattern().getType()
        if (tp.asFuncType().getParamTypes()[0].asFuncType().getParamTypes()[0].asRefType().getArgs()[0].asRefType().getIdentifier().value != "I1_") {
            return 3
        }
    /*
        if (tp.asFuncType().getParamTypes()[1].asFuncType().getParamTypes()[0].asParenType().getType().asFuncType().getRetType().asQualifiedType().getField().value != "A" ) {
            return 4
        }
        if (tp.asFuncType().getParamTypes()[2].asFuncType().getParamTypes()[0].asParenType().getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64" ) {
            return 4
        }
        if (tp.asFuncType().getRetType().asFuncType().getRetType().asParenType().getType().asTupleType().getFieldTypes()[0].asRefType().getIdentifier().value != "G2_" ) {
            return 5
        }
     */
        return 0
    }
    return 1
}
