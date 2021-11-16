// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        abstract class A<T, V> <: C & I where T<:Int32, V<:C & A {
             init(a:Int64, b!: String, c!:()->Int64={1}){}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let funcDeclOfClass = b.getBody()[0].asFuncDecl()
        if (funcDeclOfClass.getIdentifier().value != "init"){
            return 2
        }
        if (funcDeclOfClass.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 3
        }
        if (funcDeclOfClass.getParamList().getParams()[1].getType().asRefType().getIdentifier().value != "String"){
            return 4
        }
        if (!funcDeclOfClass.getParamList().getParams()[1].isNamedParam()){
            return 4
        }
        if (funcDeclOfClass.getParamList().getParams()[2].getType().asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 5
        }
        if (funcDeclOfClass.getParamList().getParams()[2].getAssignment().asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 6
        }
        if (funcDeclOfClass.getBody().size() != 0){
            return 7
        }
        return 0
    }
    return 1
}
