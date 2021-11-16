// DEPENDENCE: main.cj test20047.cj
// EXEC: %compiler %cmp_opt test20047.cj -c -backend-options="-fPIC" %enable_macro -o ./test20047.%middle
// EXEC: %compiler %cmp_opt %f ./%llvm_attach/test20047.o -c -backend-options="-fPIC" %enable_macro -o ./%n.%middle
// ERRCHECK: %compiler %cmp_opt main.cj ./%llvm_attach/%n.o ./%llvm_attach/test20047.o  %use_ast -o %output
// ASSERT: scan undeclared identifier 'input'

package define

from ast import ast.*
import test20047.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    return @test(0)
}
