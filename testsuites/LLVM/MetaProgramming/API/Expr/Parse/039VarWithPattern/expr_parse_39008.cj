// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        public var A(x,_): TimeUnit = TimeUnit.Day(1)
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
        if (b.getPattern().asEnumPattern().getTuplePattern().asTuplePattern().getPatterns()[0].asVarPattern().getVarDecl().getIdentifier().value != "x") {
            return 7
        }
        if (b.getType().asRefType().getIdentifier().value != "TimeUnit") {
            return 8
        }
        if (!b.hasInitializer()) {
            return 9
        }
        if (b.getInitializer().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "TimeUnit") {
            return 10
        }
        return 0
    }
    return 1

}
