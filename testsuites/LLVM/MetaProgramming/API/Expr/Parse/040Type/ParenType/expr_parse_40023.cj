// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (??Int64)
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isParenType()) {
            return 2
        }
        if (tp.asParenType().getType().asOptionType().getQuestNum() != Int32(2)) {
            return 3
        }
        return 0
    }
    return 1
}
