// DEPENDENCE:  test_20001.cj
// EXEC: %compiler %cmp_opt test_20001.cj %enable_macro -c -backend-options="-fPIC" -o ./test_20001.%middle
// EXEC: %compiler %cmp_opt %f -c -backend-options="-fPIC" ./test_20001.%middle -o ./%n.%middle

package define
from ast import ast.*
import test20001.*

external macro M1(input:Tokens){
    test()
    return quote(1)
}


