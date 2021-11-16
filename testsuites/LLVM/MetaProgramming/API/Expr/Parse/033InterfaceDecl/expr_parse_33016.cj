// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

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
        if (propDeclOfInterface.hasVar()){
            return 2
        }
        if (propDeclOfInterface.hasGetter()){
            return 3
        }
        if (!propDeclOfInterface.hasSetter()){
            return 4
        }
        if (propDeclOfInterface.getModifiers().toString().trim() != "public"){
            return 5
        }
        if (propDeclOfInterface.getIdentifier().value != "b"){
            return 6
        }
        if (propDeclOfInterface.getType().asPrimitiveType().getPrimitive().value !=  "Int64"){
            return 7
        }
        if (propDeclOfInterface.getSetter().getBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value !=  "v"){
            return 10
        }

        return 0
    }
    return 1
}
