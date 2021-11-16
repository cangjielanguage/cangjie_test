// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
         type A = (Float64)
    )
    let expr = ParseDecl(input)
    if (expr.isTypeAliasDecl()) {
        var aDec = expr.asTypeAliasDecl()
        if (aDec.getModifiers().toString().trim() != "") {
            return 2
        }
        if (aDec.getKeyword().value != "type") {
            return 3
        }
        if (aDec.getIdentifier().value != "A"){
            return 4
        }
        var tp = aDec.getType()
        if (tp.asParenType().getType().asPrimitiveType().getPrimitive().value != "Float64") {
            return 5
        }
        return 0
    }
    return 1
}
