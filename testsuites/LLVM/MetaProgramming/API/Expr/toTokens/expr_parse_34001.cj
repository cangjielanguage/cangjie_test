// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseLitConstExpr(input)
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
         quote(1),
         quote(1.0),
         quote(true),
         quote('a'),
         quote(0x1),
         quote(0B1),
         quote(0o0),
         quote(0XaF),
         quote(0X1.1p1),
         quote(#""#),
         quote("""
123""")
    ])
    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0

}
