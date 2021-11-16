// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        abstract class A<T, V> <: C & I where T<:Int32, V<:C & A {
             A(public var d!: Int64 = 2){
                super()
                a = b
                var c =d
                func foo() {}
             }
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let ctorDeclOfClass = b.getBody()[0].asPrimaryCtorDecl()
        if (ctorDeclOfClass.getIdentifier().value != "A"){
            return 2
        }
        if (!ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].isNamedParam()){
            return 3
        }
        if (ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].getIdentifier().value != "d"){
            return 4
        }
        if (ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].getAssignment().asLitConstExpr().getLiteral().value != "2"){
            return 5
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "super"){
            return 6
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[1].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a"){
            return 7
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[2].asDecl().asVarDecl().getIdentifier().value != "c"){
            return 8
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[3].asDecl().asFuncDecl().getIdentifier().value != "foo"){
            return 9
        }
        return 0
    }
    return 1
}
