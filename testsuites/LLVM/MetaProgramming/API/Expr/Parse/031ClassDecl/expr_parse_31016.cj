// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        class A {
            public prop let b: Int64 {
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let propDeclOfClass = b.getBody()[0].asPropDecl()
        if (propDeclOfClass.hasVar()){
            return 2
        }
        if (propDeclOfClass.hasGetter()){
            return 3
        }
        if (!propDeclOfClass.hasSetter()){
            return 4
        }
        if (propDeclOfClass.getModifiers().toString().trim() != "public"){
            return 5
        }
        if (propDeclOfClass.getIdentifier().value != "b"){
            return 6
        }
        if (propDeclOfClass.getType().asPrimitiveType().getPrimitive().value !=  "Int64"){
            return 7
        }
        if (propDeclOfClass.getSetter().getBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value !=  "v"){
            return 10
        }

        return 0
    }
    return 1
}
