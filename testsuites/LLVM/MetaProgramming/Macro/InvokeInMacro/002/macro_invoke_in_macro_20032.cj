// DEPENDENCE: define_20032.cj main_20032.cj
// EXEC: %compiler %cmp_opt define_20032.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20032.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20032.o ./%llvm_attach/%n.o %use_ast main_20032.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20032.*


enum E{e(Int64)}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    E.e(@X[1](0))
    e(@X[1](0))
    return quote(0)
}
