// DEPENDENCE: define.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo "define=./define.cjo" >>define.conf
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" >> define.conf
// EXEC: %compiler %cmp_opt -i ast.conf define.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt -i define.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

trait X{
    @M func test(a:This):This
}

append Int64 with X{
    @M func test(a:Int64):Int64{a}
}

func main(){
    return test(0)
}