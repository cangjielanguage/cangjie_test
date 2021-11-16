// DEPENDENCE: define_20049.cj main_20049.cj
// EXEC: %compiler %cmp_opt define_20049.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20049.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20049.o ./%llvm_attach/%n.o %use_ast main_20049.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20049.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    match (@X[true](123)) {
        case _ if (@X[true](123)) => return quote(0)
        case _ => return quote(2)
    }
    return quote(1)
}