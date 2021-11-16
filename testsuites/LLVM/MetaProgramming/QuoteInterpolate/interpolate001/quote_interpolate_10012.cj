// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output  %run_args

package define

from ast import ast.*

let a = 'a'

external macro test(input:Tokens):Tokens{
    var x = quote($a)
    x.dump()
    return quote(0)
}
