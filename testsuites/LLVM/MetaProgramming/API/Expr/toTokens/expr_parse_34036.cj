// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseTryExpr(input)
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
                try {
                    var a = b + 1
                } catch(e1: RunTime) {
                    e1.back_trace()
                } catch(e2: Argument) {
                    e2.back_trace()
                } catch(e3: Int64) {
                    e3.back_trace()
                } finally {
                    a = 2
            }),
            quote(
                try {
                    try {} catch(_) {}
                } catch(e: RunTime) {
                    try {} catch(_) {}
                } finally {
                    try {} catch(_) {}
            })
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
