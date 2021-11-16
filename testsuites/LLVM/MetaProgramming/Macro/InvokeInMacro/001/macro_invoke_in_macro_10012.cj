// DEPENDENCE: define_10012.cj main_10012.cj
// EXEC: %compiler %cmp_opt define_10012.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_10012.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_10012.o ./%llvm_attach/%n.o %use_ast main_10012.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_10012.*

external macro Y(attr:Tokens, input:Tokens):Tokens{
    var x : String = "1"

    @X[input]
    var a : String = """
    ${x}"""

    @X[input]
    var b : String = #"
    ${x}"#

    @X[input]
    var c : String = "${x}"
}