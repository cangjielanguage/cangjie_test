// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        public var A(x:Int32): TimeUnit = TimeUnit.Day(1)
    )
    let expr = ParseDecl(input)
    if (expr.isVarWithPatternDecl()) {
        var b = expr.asVarWithPatternDecl()
        if (b.getModifiers().toString().trim() != "public") {
            return 2
        }
        if (b.getKeyword().value != "var") {
            return 3
        }

        if (b.getPattern().asEnumPattern().getRef().asRefExpr().getIdentifier().value != "A") {
            return 6
        }
        var inPattern = b.getPattern().asEnumPattern().getTuplePattern().asTuplePattern().getPatterns()[0]
        inPattern.toTokens().dump()
        if (!inPattern.isTypePattern()) {
            return 7
        }
        if (b.getType().asRefType().getIdentifier().value != "TimeUnit") {
            return 9
        }
        if (!b.hasInitializer()) {
            return 10
        }
        if (b.getInitializer().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "TimeUnit") {
            return 11
        }
        return 0
    }
    return 1

}
