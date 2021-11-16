// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        public open record A<T, V> <: C & I where T<:Int32, V<:C & A {
            func foo<T>(a:T):Int64 {}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        let funcDeclOfRecord = b.getBody()[0].asFuncDecl()
        if (funcDeclOfRecord.getIdentifier().value != "foo"){
            return 2
        }
        if (funcDeclOfRecord.getType().asPrimitiveType().getPrimitive().value != "Int64"){
            return 3
        }
        if (funcDeclOfRecord.getBody().size() != 0){
            return 4
        }
        return 0
    }
    return 1
}
