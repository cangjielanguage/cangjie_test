// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_opt %use_ast test.cj -c -backend-options='-fPIC'
// EXEC: %compiler %cmp_opt %use_ast  %f ./test.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func foo(input:Int64){0}

func main(): Int64 {
    return @M(1) |> @M(foo)
}
