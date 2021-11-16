// DEPENDENCE:  test_20002.cj test_20002_2.cj
// EXEC: %compiler %cmp_opt %f %enable_macro -c -backend-options="-fPIC" -o ./%n.%middle
// EXEC: %compiler %cmp_opt %enable_macro ./%llvm_attach/%n.o test_20002.cj -c -backend-options="-fPIC" -o ./define2.%middle
// ERRCHECK: %compiler %cmp_opt test_20002_2.cj ./%llvm_attach/define2.o ./%llvm_attach/%n.o -o %output
// ASSERT: scan undeclared identifier 'M1'

package define
from ast import ast.*

external macro M1(input:Tokens){
    return quote(0)
}


