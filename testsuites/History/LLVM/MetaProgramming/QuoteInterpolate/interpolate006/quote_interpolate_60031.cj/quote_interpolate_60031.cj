// DEPENDENCE: append_60031.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_60031=./append_60031.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./%n.cjo >> define.cfg
// ERRCHECK: %compiler -i ast.cfg append_60031.cj -c -backend-options="-fPIC"
// ASSERT: scan imported trait 'ToTokens' cannot be implemented for imported type 'Option'


package define

import append_60031.*
import ast.*

external macro test(input:Tokens):Tokens{
    var a : Option<Int64> = Option<Int64>.a(1)
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
