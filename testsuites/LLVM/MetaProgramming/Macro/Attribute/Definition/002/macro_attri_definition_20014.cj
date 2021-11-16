// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

foreign var a : Int64 = 1
foreign let b : Int64 = 1
foreign func test():Unit


external macro M(attr:Tokens,input:Tokens):Tokens{
    return quote(0)
}