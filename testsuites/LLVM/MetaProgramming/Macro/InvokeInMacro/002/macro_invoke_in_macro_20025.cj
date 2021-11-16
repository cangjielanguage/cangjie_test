// DEPENDENCE: define_20025.cj main_20025.cj
// EXEC: %compiler %cmp_opt define_20025.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20025.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20025.o ./%llvm_attach/%n.o %use_ast main_20025.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20025.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[true](123)||@X[true](123)
    return quote(0)
}