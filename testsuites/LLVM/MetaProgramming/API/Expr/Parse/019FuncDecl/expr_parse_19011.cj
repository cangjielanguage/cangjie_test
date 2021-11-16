// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func bar(b!:Int64=a.b){})
    let expr = ParseFuncDecl(input)
    if (expr.getIdentifier().value != "bar") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "b") {
        return 21
    }
    if (expr.getParamList().getParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int64") {
        return 22
    }
    if (expr.getParamList().getParams()[0].getAssignment().asMemberAccess().getField().value != "b") {
        return 23
    }
    return 0

}
