// DEPENDENCE: define_10013.cj main_10013.cj
// EXEC: %compiler %cmp_opt define_10013.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_10013.o %use_pic_ast %enable_macro


package use

from ast import ast.*
import define_10013.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    1+1 // EXPECTED: regex illegal macro expand input args
}