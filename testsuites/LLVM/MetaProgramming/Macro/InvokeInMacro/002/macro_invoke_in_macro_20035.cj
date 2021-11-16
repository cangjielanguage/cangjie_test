// DEPENDENCE: define_20035.cj main_20035.cj
// EXEC: %compiler %cmp_opt define_20035.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20035.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20035.o ./%llvm_attach/%n.o %use_ast main_20035.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20035.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    ord(@X['1'](0))
    chr(@X[1](0))
    Int64(@X[0.1](0))
    return quote(0)
}