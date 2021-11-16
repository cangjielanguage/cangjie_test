// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*


func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = ParseExtendDecl(input)
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
                extend A<Int64> <: C & ?A & p.A<Int64> {
                    public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
                }
            ),
            quote(
                extend A<T> where T<: Int32, V<: p.C & Array<A> & ()->Unit {
                    public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
                }
             ),
            quote(
                extend A {
                    public prop let b: Int64 {
                        get(){
                            return a
                        }
                        set(v) {
                            a = v
                        }
                    }})
        ])

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
