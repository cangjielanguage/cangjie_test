// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is A<??Int64, ?T>
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isRefType()) {
            return 2
        }
        if (tp.asRefType().getIdentifier().value != "A") {
            return 3
        }
        if (!tp.asRefType().getArgs()[0].isOptionType()) {
            return 4
        }
        if (tp.asRefType().getArgs()[0].asOptionType().getComponentType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 5
        }
        if (tp.asRefType().getArgs()[1].asOptionType().getComponentType().asRefType().getIdentifier().value != "T") {
            return 6
        }
        return 0
    }
    return 1
}
