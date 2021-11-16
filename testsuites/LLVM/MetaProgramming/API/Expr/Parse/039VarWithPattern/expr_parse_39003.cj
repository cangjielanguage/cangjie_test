// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        var (a,b):Int32*Char
    )
    let expr = ParseDecl(input)
    if (expr.isVarWithPatternDecl()) {
        var b = expr.asVarWithPatternDecl()
        if (b.getModifiers().toString().trim() != "") {
            return 2
        }
        if (b.getKeyword().value != "var") {
            return 3
        }
        if (b.getPattern().asTuplePattern().getPatterns()[0].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 4
        }
        if (b.getPattern().asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "b") {
            return 5
        }
        if (b.getType().asTupleType().getFieldTypes()[0].asPrimitiveType().getPrimitive().value != "Int32") {
            return 6
        }
        if (b.getType().asTupleType().getFieldTypes()[1].asPrimitiveType().getPrimitive().value != "Char") {
            return 7
        }
        if (b.hasInitializer()) {
            return 7
        }
        return 0
    }
    return 1

}
