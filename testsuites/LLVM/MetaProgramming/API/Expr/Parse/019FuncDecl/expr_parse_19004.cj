// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func foo():Int64{})
    let expr = ParseFuncDecl(input)
    if (expr.getIdentifier().value != "foo") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    return 0

}
