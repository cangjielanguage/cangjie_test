// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        interface A<T, V> <: C & I where T<:Int32, V<:C & A {
            var a = 2
            func foo<T>(a:T):Int64 {}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isInterfaceDecl()) {
        var b = expr.asInterfaceDecl()
        let funcDeclOfInterface = b.getBody()[1].asFuncDecl()
        let varDeclOfInterface = b.getBody()[0].asVarDecl()
        if (varDeclOfInterface.getIdentifier().value != "a"){
            return 2
        }
        if (varDeclOfInterface.getInitializer().asLitConstExpr().getLiteral().value != "2"){
            return 3
        }
        if (funcDeclOfInterface.getIdentifier().value != "foo"){
            return 4
        }
        if (funcDeclOfInterface.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 5
        }
        if (funcDeclOfInterface.getBody().size() != 0){
            return 6
        }
        return 0
    }
    return 1
}
