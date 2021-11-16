// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(public func foo<T,V>(a:T,b!:Int64=1):Int64 where T< B,V <:Int64{})
    let expr = ParseFuncDecl(input)
    return 0

}
