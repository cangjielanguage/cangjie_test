// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(operator func +(b:Int64):Int64{})
    let expr = ParseFuncDecl(input)
    if (expr.getModifiers().toString().trim() != "operator") {
        return 1
    }
    if (expr.getIdentifier().value != "+") {
        return 2
    }
    if (expr.getBody().size() != 0) {
        return 3
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "b") {
        return 21
    }
    return 0
}
