// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        class A {}
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        try{
            var b = expr.asClassDecl().getGeneric()
        } catch(e:IllegalArgumentException) {
            return 0
        }
        return 1
    }
    return 1
}
