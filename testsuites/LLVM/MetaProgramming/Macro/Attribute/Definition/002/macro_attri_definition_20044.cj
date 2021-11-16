// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*


open class A{
    var a = 1
}

class B <: A{
    func test(){
        super.a
    }
}

external macro M(attr:Tokens,input:Tokens):Tokens{
    if (B().test() != 1) {
        return quote(1)
    }
    return quote(0)
}