// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    if (2 < 1) {
        return quote(1)
    }
    if (2 <= 1) {
        return quote(2)
    }
    if (1 > 2) {
        return quote(3)
    }
    if (1 >= 2) {
        return quote(4)
    }
    return quote(0)
}