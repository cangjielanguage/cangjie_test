// DEPENDENCE:  test.cj  test.conf
// EXEC: echo ast=%libdir/ast/ast.cjo >> test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*
from ast import ast.*


func main(){
    quote(\@M[1](+1))
    return 0
}
