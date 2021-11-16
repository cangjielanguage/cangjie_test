// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

enum A{a1(Bool)|a2(Int64)}

enum B<T>{b1(T)|b2(T)}

external macro M(attr:Tokens,input:Tokens):Tokens{
    var a = a1(true)
    var b = B<Int64>.b1(1)
    let res1 = match (a) {
        case a1(x) => 1
        case _ => 0
    }
    let res2 = match (b) {
        case b2(x) => 1
        case b1(y) => 2
        case _ => 0
    }
    if (res1 + res2 == 3) {
        return quote(0)
    }
    return quote(1)
}