// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        class A {
            public static prop var b: Int64
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let propDeclOfClass = b.getBody()[0].asPropDecl()
        if (propDeclOfClass.getModifiers().toString().trim() != "static public"){
            return 5
        }
        return 0
    }
    return 1
}
