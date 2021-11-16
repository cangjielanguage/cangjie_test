// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        interface A<T, V> <: C & I where T<:Int32, V<:C & A {
            var a = 2
        }
    )
    let expr = ParseDecl(input)
    if (expr.isInterfaceDecl()) {
        var b = expr.asInterfaceDecl()
        if (b.getBody()[0].asVarDecl().getIdentifier().value != "a"){
            return 2
        }
        if (b.getBody()[0].asVarDecl().getInitializer().asLitConstExpr().getLiteral().value != "2"){
            return 3
        }
        return 0
    }
    return 1
}
