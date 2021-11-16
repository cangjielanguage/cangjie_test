// DEPENDENCE:  define_40023.cj
// EXEC: %compiler %cmp_opt define_40023.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_40023.%middle %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import define.*

func test():Result<Int64>{
    var a = Ok(1)
    @M(a)!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
