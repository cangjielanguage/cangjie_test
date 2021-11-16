// DEPENDENCE: define_20042.cj main_20042.cj
// EXEC: %compiler %cmp_opt define_20042.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20042.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20042.o ./%llvm_attach/%n.o %use_ast main_20042.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20042.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    if (false) {
        return @X[quote(1)](123)
    } else if (false) {
        return @X[quote(2)](123)
    } else {
        return @X[quote(0)](123)
    }
    return quote(3)
}