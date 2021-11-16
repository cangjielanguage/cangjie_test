// DEPENDENCE: main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo define=./define.cjo >> main.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> main.conf
// EXEC: %compiler -i ast.conf %f -c -backend-options="-fPIC"
// EXEC: %compiler -i main.conf main.cj ./%n.o  -backend-options=%libdir/../lib/libcangjie-common.so -o %output
// EXEC: %run %run_opt %output

package define

import ast.*

external trait X<T>{
    func x(a:This,b:T):Unit
}

append<T> Int64 with X<T>{
    func x(a:Int64,b:T){}
}

external macro M(attr:Tokens,input:Tokens):Tokens{
    x(0,Int64(0))
    return quote(0)
}