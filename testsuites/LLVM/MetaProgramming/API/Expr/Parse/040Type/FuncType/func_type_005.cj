// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (p.A, p.B<Int32>)->p.C<()->Unit>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isFuncType()) {
            return 2
        }
        if (tp.asFuncType().getParamTypes()[0].asQualifiedType().getBaseType().asRefType().getIdentifier().value != "p") {
            return 3
        }
        if (tp.asFuncType().getParamTypes()[1].asQualifiedType().getTypeArguments()[0].asPrimitiveType().getPrimitive().value != "Int32" ) {
            return 4
        }
        if (tp.asFuncType().getRetType().asQualifiedType().getTypeArguments()[0].asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Unit" ) {
            return 5
        }
        return 0
    }
    return 1
}
