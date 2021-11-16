// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

class A<T>{}

type X<T> = A<T>

external macro M(attr:Tokens,input:Tokens):Tokens{
    var a : X<Int64> = A<Int64>()
    return quote(0)
}