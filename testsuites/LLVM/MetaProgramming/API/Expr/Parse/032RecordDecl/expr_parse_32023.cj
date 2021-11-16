// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        public record A<T, V> <: C & I where T<:Int32, V<:C & A {
             init(){
                super()
                a = b
                var c =d
                func foo() {}
             }
             init(a:Int64, b!: String, c!:()->Int64={1}){}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        let funcDeclOfRecord = b.getBody()[0].asFuncDecl()
        if (funcDeclOfRecord.getIdentifier().value != "init"){
            return 2
        }
        if (funcDeclOfRecord.getParamList().getParams().size() != 0){
            return 3
        }
        if (funcDeclOfRecord.getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "super"){
            return 5
        }
        if (funcDeclOfRecord.getBody()[1].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a"){
            return 6
        }
        if (funcDeclOfRecord.getBody()[2].asDecl().asVarDecl().getIdentifier().value != "c"){
            return 7
        }
        if (funcDeclOfRecord.getBody()[3].asDecl().asFuncDecl().getIdentifier().value != "foo"){
            return 8
        }

        let funcDeclOfRecord2 = b.getBody()[1].asFuncDecl()
        if (funcDeclOfRecord2.getIdentifier().value != "init"){
            return 9
        }
        if (funcDeclOfRecord2.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 10
        }
        if (funcDeclOfRecord2.getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "String"){
            return 11
        }
        if (!funcDeclOfRecord2.getParamList().getParams()[1].isNamedParam()){
            return 12
        }
        if (funcDeclOfRecord2.getParamList().getParams()[2].getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 13
        }
        if (funcDeclOfRecord2.getParamList().getParams()[2].getAssignment().asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 14
        }
        if (funcDeclOfRecord2.getBody().size()!=0){
            return 15
        }
        return 0
    }
    return 1
}
