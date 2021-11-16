// DEPENDENCE: define_20046.cj main_20046.cj
// EXEC: %compiler %cmp_opt define_20046.cj -c -backend-options="-fPIC" %enable_macro  %use_pic_ast %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c -backend-options="-fPIC" %enable_macro


package use

from ast import ast.*
import define_20046.*

interface I{
    let i : Int64 = 1
}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    I.@X[i](123) // EXPECTED: regex expected identifier here
    return quote(1)
}