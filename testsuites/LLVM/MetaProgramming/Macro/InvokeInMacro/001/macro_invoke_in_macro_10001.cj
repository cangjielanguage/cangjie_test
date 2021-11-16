// DEPENDENCE: define_10001.cj main_10001.cj
// EXEC: %compiler %cmp_opt define_10001.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10001.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10001.o ./%llvm_attach/%n.o %use_ast main_10001.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10001.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    return @X(123)
}
