// DEPENDENCE:  test_10003.cj
// EXEC: echo "define=./%n.cjo" >> test.conf
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt test_10003.cj -o %output
// ASSERT: scan macro's return token is empty, macro should return valid tokens

package define
from ast import ast.*

external macro M(input:Tokens){
    return Tokens()
}


