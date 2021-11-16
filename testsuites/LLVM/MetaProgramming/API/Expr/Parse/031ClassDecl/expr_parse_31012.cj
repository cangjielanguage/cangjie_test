// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        abstract class A<T, V> <: C & I where T<:Int32, V<:C & A {
            func foo(a:Int64):Int64
        }
    )
    let expr = ParseDecl(input)
    if (expr.isClassDecl()) {
        var b = expr.asClassDecl()
        let funcDeclOfClass = b.getBody()[0].asFuncDecl()
        if (funcDeclOfClass.getIdentifier().value != "foo"){
            return 2
        }
        if (funcDeclOfClass.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 3
        }
        return 0
    }
    return 1
}
