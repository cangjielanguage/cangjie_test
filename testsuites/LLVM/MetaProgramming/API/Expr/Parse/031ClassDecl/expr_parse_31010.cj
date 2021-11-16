// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        abstract class A<T, V> <: C & I where T<:Int32, V<:C & A {
            var a = 2
            func foo<T>(a:T):Int64 {}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let funcDeclOfClass = b.getBody()[1].asFuncDecl()
        let varDeclOfClass = b.getBody()[0].asVarDecl()
        if (varDeclOfClass.getIdentifier().value != "a"){
            return 2
        }
        if (varDeclOfClass.getInitializer().asLitConstExpr().getLiteral().value != "2"){
            return 3
        }
        if (funcDeclOfClass.getIdentifier().value != "foo"){
            return 4
        }
        if (funcDeclOfClass.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 5
        }
        if (funcDeclOfClass.getBody().size() != 0){
            return 6
        }
        return 0
    }
    return 1
}
