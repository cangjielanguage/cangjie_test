// DEPENDENCE: define_20048.cj main_20048.cj
// EXEC: %compiler %cmp_opt define_20048.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20048.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20048.o ./%llvm_attach/%n.o %use_ast main_20048.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20048.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    func test(input!:Int64=@X[0](1)){input}
    return quote($(test()))
}