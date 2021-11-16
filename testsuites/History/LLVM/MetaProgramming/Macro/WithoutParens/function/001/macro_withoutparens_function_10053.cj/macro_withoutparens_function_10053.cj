// DEPENDENCE: define.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo "define=./define.cjo" >>define.conf
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" >> define.conf
// EXEC: %compiler %cmp_opt -i ast.conf define.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt -i define.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

trait X<T>{
    @M func test(a:T):T
}

append<T> T with X<T>{
    @M func test(a:T):T{a}
}

func main(){
    return test<Int64,Int64>(Int64(0))
}