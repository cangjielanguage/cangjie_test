// DEPENDENCE: define_10006.cj main_10006.cj
// EXEC: %compiler %cmp_opt define_10006.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10006.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10006.o ./%llvm_attach/%n.o %use_ast main_10006.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10006.*

class A{}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    func test<T>(a:T,b!:Int64=1):T where T <: A{a}
}