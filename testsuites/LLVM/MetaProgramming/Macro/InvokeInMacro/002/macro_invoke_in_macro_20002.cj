// DEPENDENCE: define_20002.cj main_20002.cj
// EXEC: %compiler %cmp_opt define_20002.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20002.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20002.o ./%llvm_attach/%n.o %use_ast main_20002.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20002.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    var a = @X[123](123)
    return a
}