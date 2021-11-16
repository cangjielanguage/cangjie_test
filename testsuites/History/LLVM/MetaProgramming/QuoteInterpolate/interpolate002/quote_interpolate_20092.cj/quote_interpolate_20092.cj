// DEPENDENCE: append_20092.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_20092=./append_20092.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo append_20092=./append_20092.cjo >> define.cfg
// EXEC: echo define=./define.cjo >> define.cfg
// EXEC: %compiler -i ast.cfg append_20092.cj -c -backend-options="-fPIC"
// EXEC: %compiler -i append.cfg append_20092.o %f -c -backend-options="-fPIC"
// EXEC: %compiler -i define.cfg ./%n.o append_20092.o  -backend-options="%libdir/../lib/libcangjie-common.so" main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20092.*
import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($([1]))
    var y = quote($([1]))

    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return x
}