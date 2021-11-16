// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        extend p.A<Int64> {
            public func foo<T>(a:T, b!:Int64=1): Int64 where T<: B {}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isExtendDecl()) {
        var ex = expr.asExtendDecl()
        if (ex.getKeyword().value != "extend") {
            return 2
        }
        if (ex.getExtendedType().asQualifiedType().getBaseType().asRefType().getIdentifier().value != "p" ) {
            return 3
        }
        if (ex.getSuperInterfaces().size() != 0 ) {
            return 4
        }
        if (ex.getMembers()[0].asFuncDecl().getIdentifier().value != "foo") {
            return 5
        }
        if (ex.getGenericConstraints().size() != 0) {
            return 6
        }
        
        return 0

    }
    return 1
}
