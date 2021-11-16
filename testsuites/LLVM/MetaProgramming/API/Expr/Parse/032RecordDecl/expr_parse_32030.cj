// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        public record A<T, V> <: C & I where T<:Int32, V<:C & A {
             A(public var d!: Int64 = 2){
                super()
                a = b
                var c =d
                func foo() {}
             }
             init(a:Int64, b!: String, c!:()->Int64={1}){}
             func foo<T>(a:T):Int64 {}
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
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        if (b.getModifiers().toString().trim() != "public"){
            return 2
        }
        if (b.getKeyword().value != "record"){
            return 3
        }
        if (b.getIdentifier().value != "A"){
            return 4
        }
        if (b.getSuperTypes()[0].asRefType().getIdentifier().value != "C"){
            return 5
        }
        if (b.getSuperTypes()[1].asRefType().getIdentifier().value != "I"){
            return 6
        }
        if (b.getGeneric().getTypeParameters().toString().trim() != "T V"){
            return 8
        }
        if (b.getGeneric().getConstraints()[0].getType().getIdentifier().value != "T"){
            return 9
        }
        if (b.getGeneric().getConstraints()[0].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int32"){
            return 10
        }
        if (b.getGeneric().getConstraints()[1].getUpperBound()[0].asRefType().getIdentifier().value != "C"){
            return 11
        }
        if (b.getGeneric().getConstraints()[1].getUpperBound()[1].asRefType().getIdentifier().value != "A"){
            return 12
        }

        let ctorDeclOfRecord = b.getBody()[0].asPrimaryCtorDecl()
        if (ctorDeclOfRecord.getIdentifier().value != "A"){
            return 22
        }
        if (!ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].isNamedParam()){
            return 23
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getIdentifier().value != "d"){
            return 24
        }
        if (ctorDeclOfRecord.getFuncBody().getParamList().getParams()[0].getAssignment().asLitConstExpr().getLiteral().value != "2"){
            return 25
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "super"){
            return 26
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[1].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a"){
            return 27
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[2].asDecl().asVarDecl().getIdentifier().value != "c"){
            return 28
        }
        if (ctorDeclOfRecord.getFuncBody().getBlock().getBody()[3].asDecl().asFuncDecl().getIdentifier().value != "foo"){
            return 29
        }

        let funcDeclOfRecord = b.getBody()[1].asFuncDecl()
        if (funcDeclOfRecord.getIdentifier().value != "init"){
            return 32
        }
        if (funcDeclOfRecord.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 33
        }
        if (funcDeclOfRecord.getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "String"){
            return 34
        }
        if (!funcDeclOfRecord.getParamList().getParams()[1].isNamedParam()){
            return 34
        }
        if (funcDeclOfRecord.getParamList().getParams()[2].getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 35
        }
        if (funcDeclOfRecord.getParamList().getParams()[2].getAssignment().asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 36
        }
        if (funcDeclOfRecord.getBody().size() != 0){
            return 37
        }

        let funcDeclOfRecord2 = b.getBody()[2].asFuncDecl()
        if (funcDeclOfRecord2.getIdentifier().value != "foo"){
            return 42
        }
        if (funcDeclOfRecord2.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 43
        }
        if (funcDeclOfRecord2.getBody().size() != 0){
            return 44
        }

        let propDeclOfRecord = b.getBody()[3].asPropDecl()
        if (propDeclOfRecord.hasVar()){
            return 52
        }
        if (!propDeclOfRecord.hasGetter()){
            return 53
        }
        if (!propDeclOfRecord.hasSetter()){
            return 54
        }
        if (propDeclOfRecord.getModifiers().toString().trim() != "public"){
            return 55
        }
        if (propDeclOfRecord.getIdentifier().value != "b"){
            return 56
        }
        return 0
    }
    return 1
}
