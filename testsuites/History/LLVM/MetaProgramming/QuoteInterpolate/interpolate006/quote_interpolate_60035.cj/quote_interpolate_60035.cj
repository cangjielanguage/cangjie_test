// DEPENDENCE: append_60035.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_60035=./append_60035.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./%n.cjo >> define.cfg
// ERRCHECK: %compiler -i ast.cfg append_60035.cj -c -backend-options="-fPIC"
// ASSERT: scan imported trait 'ToTokens' cannot be implemented for imported type 'List'

package define

import append_60035.*
import ast.*

external macro test(input:Tokens):Tokens{
    var a : List<Int64> = [1]
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
