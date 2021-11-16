// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public var (a,b): Int32 = 1)
    let expr = ParseDecl(input)
    if (expr.isVarWithPatternDecl()) {
        var b = expr.asVarWithPatternDecl()
        if (b.getModifiers().toString().trim() != "public") {
            return 2
        }
        if (b.getKeyword().value != "var") {
            return 3
        }
        if(b.hasAttr("foo")) {
            return 4
        }
        return 0
    }
    return 1

}
