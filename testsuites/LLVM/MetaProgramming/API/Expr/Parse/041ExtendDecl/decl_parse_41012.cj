// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        extend A {
            public prop let b: Int64 {
                get(){
                    return a
                }
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isExtendDecl()) {
        var b = expr.asExtendDecl()
        if (!b.getMembers()[0].isPropDecl()){
            return 8
        }
        let propDeclOfExtend = b.getMembers()[0].asPropDecl()
        if (propDeclOfExtend.hasVar()){
            return 2
        }
        if (!propDeclOfExtend.hasGetter()){
            return 3
        }
        if (!propDeclOfExtend.hasSetter()){
            return 4
        }
        if (propDeclOfExtend.getModifiers().toString().trim() != "public"){
            return 5
        }
        if (propDeclOfExtend.getIdentifier().value != "b"){
            return 6
        }
        if (propDeclOfExtend.getType().asPrimitiveType().getPrimitive().value !=  "Int64"){
            return 7
        }
        if (propDeclOfExtend.getGetter().getIdentifier().value !=  "get"){
            return 8
        }
        if (propDeclOfExtend.getGetter().getBody()[0].asExpr().asReturnExpr().getExpr().asRefExpr().getIdentifier().value !=  "a"){
            return 9
        }
        if (propDeclOfExtend.getSetter().getBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value !=  "v"){
            return 10
        }

        return 0
    }
    return 1
}
