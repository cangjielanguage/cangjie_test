// DEPENDENCE: append_60021.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_60021=./append_60021.cjo >> append.cfg
// EXEC: echo append_60021=./append_60021.cjo >> define.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./define.cjo >> define.cfg
// EXEC: %compiler -i ast.cfg append_60021.cj -c -backend-options="-fPIC"
// EXEC: %compiler -i append.cfg append_60021.o %f -c -backend-options="-fPIC"
// EXEC: %compiler -i define.cfg ./%n.o append_60021.o  -backend-options="%libdir/../lib/libcangjie-common.so" main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_60021.*
import ast.*

external macro test(input:Tokens):Tokens{
    var a : A = A()
    var x = quote($a)
    var y = quote($a)
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() == 2) {
        return quote(2)
    }
    return x
}
