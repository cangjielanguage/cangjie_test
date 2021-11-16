// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        static let (a,b):Int32*Char = (1,'a')
    )
    let b = ParseVarWithPatternDecl(input)
    if (b.getModifiers().toString().trim() != "static") {
        return 2
    }
    if (b.getKeyword().value != "let") {
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
    if (!b.hasInitializer()) {
        return 7
    }
    if (b.getInitializer().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
        return 8
    }
    if (b.getInitializer().asTupleLit().getChildren()[1].asLitConstExpr().getLiteral().value != "a") {
        return 9
    }
    return 0
}
