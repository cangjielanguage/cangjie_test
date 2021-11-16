// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is ?pkgs.A<Int32>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isOptionType()) {
            return 2
        }
        if (tp.asOptionType().getComponentType().asQualifiedType().getField().value != "A" ) {
            return 3
        }
        if (tp.asOptionType().getQuestNum() != Int32(1) ) {
            return 4
        }
        return 0
    }
    return 1
}
