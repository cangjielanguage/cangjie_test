// DEPENDENCE: define_20055.cj define_20055a.cj main_20055.cj
// EXEC: %compiler %cmp_opt define_20055.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_20055a.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_20055.o ./%llvm_attach/define_20055a.o %use_pic_ast %enable_macro

package use

from ast import ast.*
import define_20055.*
import define_20055a.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @Z[@X[0](1)](@X[2](3))  //EXPECTED: regex-auto illegal attribute tokens in macro call, which is '@'
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace