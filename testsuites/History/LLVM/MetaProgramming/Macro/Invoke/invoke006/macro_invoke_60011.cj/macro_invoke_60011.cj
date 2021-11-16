// DEPENDENCE:  test.cj  test.conf
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" > ast.conf
// EXEC: %compiler %cmp_opt -i ast.conf test.cj -c -backend-options="-fPIC"
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> call.conf
// EXEC: echo test=./test.cjo >> call.conf
// EXEC: %compiler %cmp_opt -i call.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./test.o -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*
import ast.*

trait X{
    func test(a:This):Int64
}

append Tokens with X{
    func test(a:Tokens):Int64{
        @M(0)
    }
}

func main(){
    return quote(1).test()
}
