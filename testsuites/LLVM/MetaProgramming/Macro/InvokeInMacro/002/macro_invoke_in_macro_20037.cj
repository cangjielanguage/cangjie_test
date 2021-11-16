// DEPENDENCE: define_20037.cj main_20037.cj
// EXEC: %compiler %cmp_opt define_20037.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20037.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20037.o ./%llvm_attach/%n.o %use_ast main_20037.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20037.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    while (true) {
        return @X[quote(0)](123)
    }
    return quote(1)
}