// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt main.cj -o %output | compare %f
// ASSERT: scan integer_literal
// EXEC: %run %run_opt %output  %run_args

package define

from ast import ast.*

let a = 1

external macro test(input:Tokens):Tokens{
    var x = quote(
    $(
    a
   )
   )
    var y = quote(
    $(
    a
   )
   )
    x.dump()
    y.dump()
    return quote(0)
}
