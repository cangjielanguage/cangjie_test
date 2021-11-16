// DEPENDENCE: define_20033.cj main_20033.cj
// EXEC: %compiler %cmp_opt define_20033.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20033.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20033.o ./%llvm_attach/%n.o %use_ast main_20033.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20033.*


enum E<T>{e(T)}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    E<Int64>.e(@X[1](0))
    e<Int64>(@X[1](0))
    return quote(0)
}
