// DEPENDENCE: define_20031.cj main_20031.cj
// EXEC: %compiler %cmp_opt define_20031.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20031.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20031.o ./%llvm_attach/%n.o %use_ast main_20031.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20031.*


func test<T>(input:T){}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    test(@X[1](0))
    return quote(0)
}