// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote({a:Int32=>#"2"#})
    let expr = ParseLambdaExpr(input)
    if (expr.getLambdaParams()[0].getIdentifier().value != "a") {
        return 1
    }
    if (expr.getLambdaParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int32") {
        return 2
    }
    if (expr.getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "2") {
        return 3
    }
    return 0

}
