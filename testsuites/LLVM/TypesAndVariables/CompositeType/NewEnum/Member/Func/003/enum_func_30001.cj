// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_opt test.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./test.%middle %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

enum A{
    a
    @M
    func test(){}
}


func main(){
    A.a.test()
    return 0
}
