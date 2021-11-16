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
                match {
                case a is B => a is B
                case -b => -b
                case (A) => (A)
                case obj(a) => obj(a)
                case _ => 0
            }),
            quote(
                match (a(){3}) {
                case 10 if (true) => a(){3}
                case 10 if (true) => spawn {x}
                case 10 if (true) => synchronized(mtx2) {}
                case 10 if (true) => ()
            }),
            quote(
                match (A) {
                case 10 if (true) => var a: A = b
                case 10 if (true) => func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
             })
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
