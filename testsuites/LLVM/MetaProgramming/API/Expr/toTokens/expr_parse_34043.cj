// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseMatchExpr(input)
        var output = expr.toTokens()
        var flag = compareTokens(input, output)
        if (!flag) {
            print("input tokens:\n")
            input.dump()
            print("output tokens:\n")
            output.dump()
            return false
        }
    }
    return true
}


func main() {
    var inputs : Array<Tokens> = Array<Tokens>([
            quote(
                match (a) {
                    case 10 | \$c | 30 | "hi" if (true) => b
                }
            ),
            quote(
                match (a) {
                    case Day(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
                }
            ),
            quote(
                match (a) {
                    case Day(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) | Hour(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
                }
            ),
            quote(
                match (a) {
                    case (\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
                }
            ),
            quote(
                match (a) {
                    case b if (true) => b
                }
            ),
            quote(
                match (a) {
                    case _ if (true) => b
                }
            )
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
