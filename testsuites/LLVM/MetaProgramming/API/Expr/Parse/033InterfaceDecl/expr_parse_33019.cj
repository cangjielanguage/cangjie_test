// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        interface A {
            private protected prop var b: Int64
        }
    )
    let expr = ParseDecl(input)
    if (expr.isInterfaceDecl()) {
        var b = expr.asInterfaceDecl()
        let propDeclOfInterface = b.getBody()[0].asPropDecl()
        if (propDeclOfInterface.getModifiers().toString().trim() != "private protected"){
            return 5
        }
        return 0
    }
    return 1
}
