// DEPENDENCE: define_20039.cj main_20039.cj
// EXEC: %compiler %cmp_opt define_20039.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20039.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20039.o ./%llvm_attach/%n.o %use_ast main_20039.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20039.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    do {} while (@X[false](123))
    return quote(0)
}