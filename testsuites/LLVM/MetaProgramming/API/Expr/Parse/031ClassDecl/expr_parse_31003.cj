// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        open class A <: C & I {}
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        if (b.getModifiers().toString().trim() != "open"){
            return 2
        }
        if (b.getKeyword().value != "class"){
            return 3
        }
        if (b.getIdentifier().value != "A"){
            return 4
        }
        if (b.getSuperTypes()[0].asRefType().getIdentifier().value != "C"){
            return 5
        }
        if (b.getSuperTypes()[1].asRefType().getIdentifier().value != "I"){
            return 6
        }
        if (b.getBody().size() != 0){
            return 6
        }

        return 0
    }
    return 1
}
