// DEPENDENCE:  test_20004.cj
// EXEC: %compiler %cmp_opt %f %enable_macro -c -backend-options="-fPIC" -o ./test_20004.%middle
// EXEC: %compiler %cmp_opt ./test_20004.%middle test_20004.cj %pic_opt

package define
from ast import ast.*

external macro M(input:Tokens){
    return quote(1)
}




