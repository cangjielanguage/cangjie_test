// DEPENDENCE: define_20047.cj main_20047.cj
// EXEC: %compiler %cmp_opt define_20047.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20047.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20047.o ./%llvm_attach/%n.o %use_ast main_20047.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20047.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    [quote(0),quote(1)][@X[0](1)]
}