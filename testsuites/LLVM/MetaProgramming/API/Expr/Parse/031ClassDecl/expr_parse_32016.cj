// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        record A {
            public prop let b: Int64 {
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        let propDeclOfRecord = b.getBody()[0].asPropDecl()
        if (propDeclOfRecord.hasVar()){
            return 2
        }
        if (propDeclOfRecord.hasGetter()){
            return 3
        }
        if (!propDeclOfRecord.hasSetter()){
            return 4
        }
        if (propDeclOfRecord.getModifiers().toString().trim() != "public"){
            return 5
        }
        if (propDeclOfRecord.getIdentifier().value != "b"){
            return 6
        }
        if (propDeclOfRecord.getType().asPrimitiveType().getPrimitive().value !=  "Int64"){
            return 7
        }
        if (propDeclOfRecord.getSetter().getBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value !=  "v"){
            return 10
        }

        return 0
    }
    return 1
}
