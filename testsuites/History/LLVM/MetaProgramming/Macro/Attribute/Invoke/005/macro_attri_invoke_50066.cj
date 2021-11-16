// DEPENDENCE:  test.cj  test.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: %compiler %cmp_opt -i ast.conf test.cj -c
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> call.conf
// EXEC: echo test=./test.cjo >> call.conf
// EXEC: %compiler %cmp_opt -i call.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./test.o -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

interface I{
    let i = 1
}

func main(){
    @M[I.i](0)
    @M[I](0).i
    return 0
}
