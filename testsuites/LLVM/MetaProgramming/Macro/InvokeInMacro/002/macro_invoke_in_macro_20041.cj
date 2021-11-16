// DEPENDENCE: define_20041.cj main_20041.cj
// EXEC: %compiler %cmp_opt define_20041.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20041.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20041.o ./%llvm_attach/%n.o %use_ast main_20041.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20041.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    for (i in 0..10:1) {
        return @X[quote(0)](123)
    }
    return quote(10)
}