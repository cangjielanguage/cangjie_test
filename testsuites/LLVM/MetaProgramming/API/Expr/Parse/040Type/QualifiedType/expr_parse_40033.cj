// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is A.B<String, Int32, (C), c.d<Int64>, ????In64, In64*String>
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
        if (tp.asQualifiedType().getTypeArguments()[0].asRefType().getIdentifier().value != "String") {
            return 6
        }
        if (tp.asQualifiedType().getTypeArguments()[1].asPrimitiveType().getPrimitive().value != "Int32" ) {
            return 7
        }
        if (tp.asQualifiedType().getTypeArguments()[2].asParenType().getType().asRefType().getIdentifier().value != "C" ) {
            return 8
        }
        if (tp.asQualifiedType().getTypeArguments()[3].asQualifiedType().getTypeArguments()[0].asPrimitiveType().getPrimitive().value != "Int64" ) {
            return 9
        }
        if (tp.asQualifiedType().getTypeArguments()[4].asOptionType().getQuestNum() != Int32(4) ) {
            return 10
        }
        if (tp.asQualifiedType().getTypeArguments()[5].asTupleType().getFieldTypes()[1].asRefType().getIdentifier().value != "String" ) {
            return 11
        }
        return 0
    }
    return 1
}
