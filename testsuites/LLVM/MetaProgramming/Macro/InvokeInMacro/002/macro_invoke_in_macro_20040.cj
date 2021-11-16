// DEPENDENCE: define_20040.cj main_20040.cj
// EXEC: %compiler %cmp_opt define_20040.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20040.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20040.o ./%llvm_attach/%n.o %use_ast main_20040.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20040.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    for (i in @X[0..10:1](123)) {
        return quote($i)
    }
    return quote(10)
}