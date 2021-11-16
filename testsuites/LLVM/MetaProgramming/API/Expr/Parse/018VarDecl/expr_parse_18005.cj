// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(let b: Int32)
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getKeyword().value != "let") {
        return 2
    }
    if (b.getIdentifier().value != "b") {
        return 3
    }
    return 0

}
