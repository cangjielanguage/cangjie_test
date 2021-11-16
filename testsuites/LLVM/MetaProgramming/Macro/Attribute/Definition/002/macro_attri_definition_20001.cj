// DEPENDENCE: test20001.cj main.cj
// EXEC: %compiler %cmp_opt test20001.cj -c -backend-options="-fPIC" %enable_macro -o ./test20001.%middle
// EXEC: %mv_or_ls ./%llvm_attach/test20001.cjo %cur_dir && %compiler %cmp_opt %f -c -backend-options="-fPIC" %enable_macro -o ./%n.%middle
// EXEC: %compiler %cmp_opt main.cj %use_ast ./%llvm_attach/%n.o ./%llvm_attach/test20001.o -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*
import test20001.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    a()
    return quote(0)
}
