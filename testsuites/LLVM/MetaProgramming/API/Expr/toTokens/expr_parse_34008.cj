// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseAssignExpr(input)
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
            quote(a=b),
            quote(a=f|>g),
            quote(a=!b),
            quote(a=(b)),
            quote(a=foo()),
            quote(a=return 1),
            quote(a=A.c),
            quote(a=f(1){ i => i * i }),
            quote(a[b]=1),
            quote(a**=b),
            quote(a*=b),
            quote(a/=b),
            quote(a%=b),
            quote(a+=b),
            quote(a-=b),
            quote(a<<=b),
            quote(a&=b)
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
