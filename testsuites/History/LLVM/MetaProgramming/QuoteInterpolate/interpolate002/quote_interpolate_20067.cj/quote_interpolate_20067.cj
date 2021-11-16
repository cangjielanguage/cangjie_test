// DEPENDENCE: append_20067.cj main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> append.cfg
// EXEC: echo append_20067=./append_20067.cjo >> append.cfg
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.cfg
// EXEC: echo define=./%n.cjo >> define.cfg
// EXEC: %compiler -i ast.cfg append_20067.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler -i append.cfg append_20067.o %f -c -backend-options="-fPIC"
// ASSERT: scan no matching function declaration for function call 'toTokens'

package define

import append_20067.*
import ast.*

let a = [0,1]

external macro test(input:Tokens):Tokens{
    var x = quote($a[0])
    var y = quote($a[0])

    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(0)
}