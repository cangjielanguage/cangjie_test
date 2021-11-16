// DEPENDENCE: append_60037.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_60037=./append_60037.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./%n.cjo >> define.cfg
// ERRCHECK: %compiler -i ast.cfg append_60037.cj -c -backend-options="-fPIC"
// ASSERT: scan imported trait 'ToTokens' cannot be implemented for imported type 'ArrayList'

package define

import append_60037.*
import ast.*

external macro test(input:Tokens):Tokens{
    var a : ArrayList<Int64> = ArrayList<Int64>()
    var x = quote($a)
    var y = quote($a)
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 2) {
        return quote(2)
    }
    return x
}
