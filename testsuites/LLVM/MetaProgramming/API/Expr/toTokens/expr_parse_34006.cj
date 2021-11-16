// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseRefExpr(input)
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
            quote(a),
            quote(`a`),
            quote(`a_1_A__`),
            quote(a<T,V>),
            quote(`a`<Int64,Bool>)
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
