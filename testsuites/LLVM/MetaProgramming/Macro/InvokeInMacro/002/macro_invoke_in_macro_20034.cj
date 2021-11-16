// DEPENDENCE: define_20034.cj main_20034.cj
// EXEC: %compiler %cmp_opt define_20034.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20034.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20034.o ./%llvm_attach/%n.o %use_ast main_20034.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20034.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    Option<Int64>.Some(@X[1](0))
    Some<Int64>(@X[1](0))
    return quote(0)
}
