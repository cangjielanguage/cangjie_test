// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define.%middle %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import define.*

func test():Option<Int64>{
    var b = 1
    var x : ?Int64 = @M(b)
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
