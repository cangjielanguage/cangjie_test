// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_opt %use_ast test.cj -c -backend-options='-fPIC'
// EXEC: %compiler %cmp_opt %use_ast  %f ./test.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func a(input:Bool):Bool{true}

func main(): Int64 {
    @M(true|>a)
    @M(true|>(a~>a))
    return 0
}
