// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public func foo(a:A,b!:Int64=1):Int64 {})
    let expr = ParseFuncDecl(input)
    if (expr.getModifiers().toString().trim() != "public") {
        return 1
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "a") {
        return 21
    }
    if (expr.getParamList().getParams()[0].getType().asRefType().getIdentifier().value != "A") {
        return 22
    }
    if (expr.getParamList().getParams()[1].getAssignment().asLitConstExpr().getLiteral().value != "1") {
        return 23
    }
    if (expr.getParamList().getParams()[1].getType().asPrimitiveType().getPrimitive().value != "Int64") {
        return 24
    }
    if (expr.getIdentifier().value != "foo") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    return 0

}
