// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func bar(a:Int64):Int64{var b=1; -b; return 2})
    let expr = ParseDecl(input)
    if (expr.isFuncDecl()){
        let b = expr.asFuncDecl()
        if (b.getIdentifier().value != "bar") {
            return 1
        }
        if (b.getBody()[0].asDecl().asVarDecl().getIdentifier().value != "b") {
            return 21
        }
        if (b.getBody()[1].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 22
        }
        if (b.getBody()[2].asExpr().asReturnExpr().getExpr().asLitConstExpr().getLiteral().value != "2") {
            return 23
        }
        if (b.getType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 3
        }
        if (b.getParamList().getParams()[0].getIdentifier().value != "a") {
            return 4
        }
        if (b.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 5
        }
        return 0
    }
    return 10
}
