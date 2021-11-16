// DEPENDENCE: define_20053.cj main_20053.cj
// EXEC: %compiler %cmp_opt define_20053.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f ./%llvm_attach/define_20053.o -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20053.o ./%llvm_attach/%n.o %use_ast main_20053.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20053.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    quote($(@X[0](123)))
}