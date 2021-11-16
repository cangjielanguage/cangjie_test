// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        public record A<T, V> <: C & I where T<:Int32, V<:C & A {
             A( b!: String = "hi",
                public let d!: Int64 = 2){
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
        if (!ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].isNamedParam()){
            return 3
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getIdentifier().value != "b"){
            return 4
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getType().asRefType().getIdentifier().value != "String"){
            return 5
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getAssignment().asLitConstExpr().getLiteral().value != "hi"){
            return 6
        }
        if (!ctorDeclOfRecord.getFuncBody().getParamList().getParams()[1].isNamedParam()){
            return 7
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[1].getIdentifier().value != "d"){
            return 8
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[1].getAssignment().asLitConstExpr().getLiteral().value != "2"){
            return 9
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
