// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        public record A<T, V> <: C & I where T<:Int32, V<:C & A {
             A(a:Int64,
                b!: String,
                c!:()->Int64={1},
                public var d!: Int64 = 2){
                    super()
                    a = b
                    var c =d
                    func foo() {}
                }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        let ctorDeclOfRecord = b.getBody()[0].asPrimaryCtorDecl()
        if (ctorDeclOfRecord.getIdentifier().value != "A"){
            return 2
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getIdentifier().value != "a"){
            return 3
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 4
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[1].getIdentifier().value != "b"){
            return 5
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "String"){
            return 6
        }
        if (!ctorDeclOfRecord.getFuncBody().getParamList().getParams()[2].isNamedParam()){
            return 7
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[2].getIdentifier().value != "c"){
            return 8
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[2].getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 9
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[3].getIdentifier().value != "d"){
            return 10
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[3].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 11
        }

        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "super"){
            return 12
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[1].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a"){
            return 13
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[2].asDecl().asVarDecl().getIdentifier().value != "c"){
            return 14
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[3].asDecl().asFuncDecl().getIdentifier().value != "foo"){
            return 15
        }
        return 0
    }
    return 1
}
