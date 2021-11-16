// DEPENDENCE: append_40005.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_40005=./append_40005.cjo >> append.cfg
// EXEC: echo append_40005=./append_40005.cjo >> define.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./define.cjo >> define.cfg
// EXEC: %compiler -i ast.cfg append_40005.cj -c -backend-options="-fPIC"
// EXEC: %compiler -i append.cfg append_40005.o %f -c -backend-options="-fPIC"
// EXEC: %compiler -i define.cfg ./%n.o append_40005.o  -backend-options="%libdir/../lib/libcangjie-common.so" main.cj -o %output | compare %f
// ASSERT: scan integer_literal
// EXEC: %run %run_opt %output %run_args

package define

import append_40005.*
import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($a)
    var y = quote($a)
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(3)
    }
    x.dump()
    y.dump()
    return x
}