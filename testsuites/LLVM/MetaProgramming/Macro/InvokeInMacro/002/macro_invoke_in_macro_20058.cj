// DEPENDENCE: define_20058.cj main_20058.cj
// EXEC: %compiler %cmp_opt define_20058.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_20058.o %use_pic_ast %enable_macro


package use

from ast import ast.*
import define_20058.*


external macro Y(attr:Tokens, input:Tokens):Tokens{
    var a : Int64 = 1
    synchronized ((a)) {@X[0](1)} // EXPECTED: regex expected Mutex object after synchronized
    return quote(0)
}