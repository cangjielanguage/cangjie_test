// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
        let (a,b)
    )
    let expr = ParseDecl(input)
    if (expr.isVarWithPatternDecl()) {
        var b = expr.asVarWithPatternDecl()
        if (b.getModifiers().toString().trim() != "") {
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
        return 0
    }
    return 1

}
