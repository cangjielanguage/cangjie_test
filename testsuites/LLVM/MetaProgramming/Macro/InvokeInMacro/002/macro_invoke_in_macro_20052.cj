// DEPENDENCE: define_20052.cj main_20052.cj
// EXEC: %compiler %cmp_opt define_20052.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20052.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20052.o ./%llvm_attach/%n.o %use_ast main_20052.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20052.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    var a = #"${@X[1](0)}"#
    if (a != "1") {
        return quote(0)
    }
    return quote(1)
}
