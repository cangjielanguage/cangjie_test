// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        record A {}
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        try{
            var b = expr.asRecordDecl().getGeneric()
        } catch(e:IllegalArgumentException) {
            return 0
        }
        return 1
    }
    return 1
}
