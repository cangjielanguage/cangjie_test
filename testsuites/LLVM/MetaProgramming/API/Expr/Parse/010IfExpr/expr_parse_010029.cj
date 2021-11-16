// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (false) {
             func foo<T1,T2>(a: T1){}
        } else {
             func foo<T1>(a: T1)where T1 <: Int32{}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 1
        }
        if (b.getIfBody()[0].asDecl().asFuncDecl().getGeneric().getTypeParameters().toString() != "T1 T2 ") {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asDecl().asFuncDecl().getGeneric().getConstraints()[0].getType().getIdentifier().value != "T1") {
            return 3
        }

        return 0
    }
    return 4
}
