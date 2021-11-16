// DEPENDENCE: define_10014.cj main_10014.cj
// EXEC: %compiler %cmp_opt define_10014.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_10014.o %use_pic_ast %enable_macro


package use

from ast import ast.*
import define_10014.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    class A{} // EXPECTED: regex 'class' is not allowed in block, expected expression or declaration here
}