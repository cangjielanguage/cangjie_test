// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

external class C{}

external func foo<T>(input:T) where T <: C{}
internal func baz(input!:Int64=1){}

external macro M(attr:Tokens,input:Tokens):Tokens{
    foo<C>(C())

    func bar(){}
    bar()
    return quote(0)
}