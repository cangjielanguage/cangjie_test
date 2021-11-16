// DEPENDENCE: define_10005.cj main_10005.cj
// EXEC: %compiler %cmp_opt define_10005.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10005.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10005.o ./%llvm_attach/%n.o %use_ast main_10005.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10005.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    func test(){}
}