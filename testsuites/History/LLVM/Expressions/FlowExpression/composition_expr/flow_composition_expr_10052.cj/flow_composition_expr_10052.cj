// DEPENDENCE:  test.cj  test.conf
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" > ast.conf
// EXEC: %compiler %cmp_opt -i ast.conf test.cj -c -backend-options="-fPIC"
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" >> call.conf
// EXEC: echo "test=./test.cjo" >> call.conf
// EXEC: %compiler %cmp_opt -i call.conf -backend-options="%libdir/../lib/libcangjie-common.so"  %f ./test.o -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func a(input:Bool):Bool{true}

trait X{func asFunc(x:This,y:Int64):Int64}
append Int64 with X{func asFunc(x:Int64,y:Int64):Int64{0}}


func main(): Int64 {
    @M(1) |> @M(1)
    return 0
}
