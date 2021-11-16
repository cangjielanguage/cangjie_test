// DEPENDENCE: define_20045.cj main_20045.cj
// EXEC: %compiler %cmp_opt define_20045.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20045.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20045.o ./%llvm_attach/%n.o %use_ast main_20045.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20045.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    match (@X[true](123)) {
        case _ => return quote(0)
    }
    return quote(1)
}