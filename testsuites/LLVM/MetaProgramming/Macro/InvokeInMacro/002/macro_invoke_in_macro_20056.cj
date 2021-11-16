// DEPENDENCE: define_20056.cj define_20056a.cj main_20056.cj
// EXEC: %compiler %cmp_opt define_20056.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_20056a.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_20056.o ./%llvm_attach/define_20056a.o %use_pic_ast %enable_macro

package use

from ast import ast.*
import define_20056.*
import define_20056a.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @Z[@X[0](1)] //EXPECTED: regex-auto illegal attribute tokens in macro call, which is '@'
    @X[2](3)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace