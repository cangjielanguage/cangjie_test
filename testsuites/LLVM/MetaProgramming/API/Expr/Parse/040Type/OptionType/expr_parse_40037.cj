// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func getSuffix(end: Int64): Tokens {
    var suffix = quote(?)
    for (i in 1..end) {
        suffix = suffix + quote(?)
    }
    return suffix
}

func main(): Int64 {
    var len = 2000
    var input: Tokens = quote(
        a is
    )
    input = input + getSuffix(len) + quote(Int64)
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isOptionType()) {
            return 2
        }
        if (tp.asOptionType().getComponentType().asPrimitiveType().getPrimitive().value != "Int64" ) {
            return 3
        }
        if (tp.asOptionType().getQuestNum() != Int32(len) ) {
            return 4
        }
        return 0
    }
    return 1
}
