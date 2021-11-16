// DEPENDENCE: define_10003.cj main_10003.cj
// EXEC: %compiler %cmp_opt define_10003.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10003.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10003.o ./%llvm_attach/%n.o %use_ast main_10003.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10003.*

external macro Y(input:Tokens):Tokens{
    return @X[attr](input) // just pass identifier
}