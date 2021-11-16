// DEPENDENCE:  test_70003.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run %compiler %cmp_opt %macro_lib_opt test_70003.cj -o %output | compare %f
// ASSERT: scan hello macro
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro M(input:Tokens){
    print("hello macro")
    return Tokens(@{Token(INTEGER_LITERAL,"1")}) + quote(+) + input  // integer literal is 152
}
