// DEPENDENCE: define_20023.cj main_20023.cj
// EXEC: %compiler %cmp_opt define_20023.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20023.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20023.o ./%llvm_attach/%n.o %use_ast main_20023.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20023.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    if(@X[true](123)){@X[true](123)}else{@X[true](123)}
    return quote(0)
}
