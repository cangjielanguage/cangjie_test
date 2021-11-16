// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(#{})
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var b = expr.asSetOrMapLit()
        if (b.getElements().size() != 0){
            return 1
        }
        return 0
    }
    return 4
}
