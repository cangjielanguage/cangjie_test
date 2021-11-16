// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    var res = match (1) {
        case a => quote(0)
        case _ => quote(1)
    }
    return res
}