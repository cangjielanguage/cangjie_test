// DEPENDENCE: define_10015.cj main_10015.cj
// EXEC: %compiler %cmp_opt define_10015.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_10015.o %use_pic_ast %enable_macro


package use

from ast import ast.*
import define_10015.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    record A{} // EXPECTED: regex-auto 'record' is not allowed in block, expected expression or declaration here
}