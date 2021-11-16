// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %pic_opt
// EXEC: %run %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output

package define

from ast import ast.*

typealias mytype = IntNative

external macro M(attr:Tokens,input:Tokens):Tokens{
    var a : mytype = 0
    return quote($a)
}

