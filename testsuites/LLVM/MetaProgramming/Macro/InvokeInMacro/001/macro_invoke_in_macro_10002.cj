// DEPENDENCE: define_10002.cj main_10002.cj
// EXEC: %compiler %cmp_opt define_10002.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10002.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10002.o ./%llvm_attach/%n.o %use_ast main_10002.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10002.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    return @X[attr](input) // just pass identifier
}
