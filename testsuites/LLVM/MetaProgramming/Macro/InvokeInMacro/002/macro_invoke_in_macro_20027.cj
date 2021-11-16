// DEPENDENCE: define_20027.cj main_20027.cj
// EXEC: %compiler %cmp_opt define_20027.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20027.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20027.o ./%llvm_attach/%n.o %use_ast main_20027.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20027.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    var a = (@X[0](1), @X[0](1))
    return quote($(a[0]))
}