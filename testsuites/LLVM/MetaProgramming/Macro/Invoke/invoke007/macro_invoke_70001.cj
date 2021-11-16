// DEPENDENCE:  test_70001.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_70001.cj -o %output | compare %f
// ASSERT: scan hello macro
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro M(input:Tokens){
    print("hello macro")
    input + quote(+) + input
}