// DEPENDENCE: append_40004.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_40004=./append_40004.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo append_40004=./append_40004.cjo >> define.cfg
// EXEC: echo define=./define.cjo >> define.cfg
// EXEC: %compiler -i ast.cfg append_40004.cj -c -backend-options="-fPIC"
// EXEC: %compiler -i append.cfg append_40004.o %f -c -backend-options="-fPIC"
// EXEC: %compiler -i define.cfg ./%n.o append_40004.o  -backend-options="%libdir/../lib/libcangjie-common.so" main.cj -o %output | compare %f
// ASSERT: scan integer_literal
// EXEC: %run %run_opt %output %run_args

package define

import append_40004.*
import ast.*

external macro test(input:Tokens):Tokens{
    var a = [1]
    var x = quote(match (true) {case in $a => c})
    var y = quote(match (true) {case in $a => c})

    x.dump()
    y.dump()

    if (x.size() == 1) {
        return quote(1)
    }
    if (y.size() == 1) {
        return quote(2)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(3)
    }


    return quote(0)
}