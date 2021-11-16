// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    do {
        return quote(0)
    } while (true)
    return quote(1)
}