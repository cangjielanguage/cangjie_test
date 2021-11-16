// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from ast import ast.*

func test(){
    var x = quote($return)
    x.dump()
}

func main(){
    test()
    return 0
}
