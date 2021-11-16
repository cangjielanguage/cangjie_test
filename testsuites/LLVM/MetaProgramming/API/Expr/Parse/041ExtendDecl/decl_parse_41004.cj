// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        extend A<Int64> <: C & ?A &  {
            public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
        }
    )
    let expr = ParseDecl(input)
    return 0
}
