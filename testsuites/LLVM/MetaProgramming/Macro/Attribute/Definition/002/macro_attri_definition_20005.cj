// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

internal var a : Int64 = 1
external let b : Int64 = 1

external macro M(attr:Tokens,input:Tokens):Tokens{
    let c : Int64 = 1
    func test(){
        var d = c
        attr
    }
    var e = a
    return quote(0)
}