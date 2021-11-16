// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        interface A {
            public prop let b: Int64 {
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isInterfaceDecl()) {
        var b = expr.asInterfaceDecl()
        let propDeclOfInterface = b.getBody()[0].asPropDecl()
        if (propDeclOfInterface.getSetter().getBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value !=  "v"){
            return 10
        }

        return 0
    }
    return 1
}
