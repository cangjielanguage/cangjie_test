// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseForInExpr(input)
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
            quote(for (item in list) if (c) {}),
            quote(for (A(x) | B (_) in list) {}),
            quote(for (_ in list) if (c) {}),
            quote(for ((x, y) in list) if (c) {}),
            quote(for (i in try {} catch(_) {} finally {}) if (try {} catch(_) {} finally {}){ try {} catch(_) {} finally {}})
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
