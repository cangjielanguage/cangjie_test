// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseTypeAliasDecl(input)
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
            quote(external type A<T, V> = B<Int64>),
            quote(type A<T, V> = ((((M7_<I1_>)->G1_))->(G2_*G3_), (((M7_<I1_>)->G1.A<Int64>))->(G2_*G3_), (((M7_<I1_>)->Int64))->(G2_*G3_))-> (((M7_<I1_>)->G1_))->(G2_*G3_))
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
