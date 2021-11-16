// DEPENDENCE: define_20036.cj main_20036.cj
// EXEC: %compiler %cmp_opt define_20036.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20036.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20036.o ./%llvm_attach/%n.o %use_ast main_20036.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20036.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    while (@X[false](123)) {
        return quote(1)
    }
    return quote(0)
}