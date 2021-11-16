// DEPENDENCE: define_10007.cj main_10007.cj
// EXEC: %compiler %cmp_opt define_10007.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10007.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10007.o ./%llvm_attach/%n.o %use_ast main_10007.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10007.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    var a : List<Int64> = [1]
}