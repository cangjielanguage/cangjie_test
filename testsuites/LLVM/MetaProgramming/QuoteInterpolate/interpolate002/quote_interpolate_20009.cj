// DEPENDENCE: append_20009.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20009.cj %append_opt
// EXEC-PIPE-1: %compiler %cmp_opt %f %append_pic_opt 2>&1 | compare %f

package define

import append_20009.*
from ast import ast.*

func a(input:Int64){
    return input
}

func b(input:Int64){
    return input
}

external macro test(input:Tokens):Tokens{
    var a = 1
    var x = a~>b  // EXPECTED: regex type check of flow expression fails for operator ~>
    var y = a~>b  // EXPECTED: regex type check of flow expression fails for operator ~>


    return quote(0)
}
