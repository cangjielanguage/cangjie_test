// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        var _: B = a
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
        if (!b.getPattern().isWildcardPattern()) {
            return 4
        }
        if (b.getType().asRefType().getIdentifier().value != "B") {
            return 6
        }
        if (!b.hasInitializer()) {
            return 7
        }
        if (b.getInitializer().asRefExpr().getIdentifier().value != "a") {
            return 8
        }
        return 0
    }
    return 1

}
