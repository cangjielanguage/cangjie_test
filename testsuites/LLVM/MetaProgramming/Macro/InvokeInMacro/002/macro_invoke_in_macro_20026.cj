// DEPENDENCE: define_20026.cj main_20026.cj
// EXEC: %compiler %cmp_opt define_20026.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20026.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20026.o ./%llvm_attach/%n.o %use_ast main_20026.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20026.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    var a = @X[0](1)
    return quote($a)
}