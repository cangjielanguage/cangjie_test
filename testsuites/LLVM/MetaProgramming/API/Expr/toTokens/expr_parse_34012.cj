// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseTrailingClosureExpr(input)
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
            quote(foo(a, b:A){
                a:Int32,b: A =>
                    var b = 1
                    return a+b
             })
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
