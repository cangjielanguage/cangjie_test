// DEPENDENCE: append_20010.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20010.cj %append_opt
// EXEC: %compiler %cmp_opt %f %enable_macro %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt %append_macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20010.*
from ast import ast.*

func a(input:Int64){
    return input
}

func b(input:Int64){
    return input
}

external macro test(input:Tokens):Tokens{
    var a = 1
    var x = quote($a~>b)
    var y = quote($a~>b)

    if (x.size() == 1) {
        return quote(1)
    }

    if (x.get(0).value != quote(1).get(0).value) {
        return quote(2)
    }
    return quote(0)
}