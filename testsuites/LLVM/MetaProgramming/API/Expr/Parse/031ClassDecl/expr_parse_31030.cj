// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        public class A<T, V> <: C & I where T<:Int32, V<:C & A {
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
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        if (b.getModifiers().toString().trim() != "public"){
            return 2
        }
        if (b.getKeyword().value != "class"){
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

        let ctorDeclOfClass = b.getBody()[0].asPrimaryCtorDecl()
        if (ctorDeclOfClass.getIdentifier().value != "A"){
            return 22
        }
        if (!ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].isNamedParam()){
            return 23
        }
        if (ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].getIdentifier().value != "d"){
            return 24
        }
        if (ctorDeclOfClass.getFuncBody().getParamList().getParams()[0].getAssignment().asLitConstExpr().getLiteral().value != "2"){
            return 25
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "super"){
            return 26
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[1].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a"){
            return 27
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[2].asDecl().asVarDecl().getIdentifier().value != "c"){
            return 28
        }
        if (ctorDeclOfClass.getFuncBody().getBlock().getBody()[3].asDecl().asFuncDecl().getIdentifier().value != "foo"){
            return 29
        }

        let funcDeclOfClass = b.getBody()[1].asFuncDecl()
        if (funcDeclOfClass.getIdentifier().value != "init"){
            return 32
        }
        if (funcDeclOfClass.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 33
        }
        if (funcDeclOfClass.getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "String"){
            return 34
        }
        if (!funcDeclOfClass.getParamList().getParams()[1].isNamedParam()){
            return 34
        }
        if (funcDeclOfClass.getParamList().getParams()[2].getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 35
        }
        if (funcDeclOfClass.getParamList().getParams()[2].getAssignment().asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 36
        }
        if (funcDeclOfClass.getBody().size() != 0){
            return 37
        }

        let funcDeclOfClass2 = b.getBody()[2].asFuncDecl()
        if (funcDeclOfClass2.getIdentifier().value != "foo"){
            return 42
        }
        if (funcDeclOfClass2.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 43
        }
        if (funcDeclOfClass2.getBody().size() != 0){
            return 44
        }

        let propDeclOfClass = b.getBody()[3].asPropDecl()
        if (propDeclOfClass.hasVar()){
            return 52
        }
        if (!propDeclOfClass.hasGetter()){
            return 53
        }
        if (!propDeclOfClass.hasSetter()){
            return 54
        }
        if (propDeclOfClass.getModifiers().toString().trim() != "public"){
            return 55
        }
        if (propDeclOfClass.getIdentifier().value != "b"){
            return 56
        }
        return 0
    }
    return 1
}
