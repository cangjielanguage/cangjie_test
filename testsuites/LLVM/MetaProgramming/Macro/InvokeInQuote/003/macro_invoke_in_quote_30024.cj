// DEPENDENCE: define_30024.cj
// EXEC: echo ast=%libdir/ast/ast.cjo > ast.conf
// EXEC: echo ast=%libdir/ast/ast.cjo >> use.conf
// EXEC: echo define_30024=./define_30024.cjo >> use.conf
// EXEC: %compiler %cmp_opt define_30024.cj -c -backend-options="-fPIC" -o define_30024.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30024.%middle %use_pic_ast -o use.%middle 2>&1 | compare %f



package use

import ast.*
import define_30024.*

var flag = 1
var count = 1

external macro X(attr:Tokens, input:Tokens):Tokens{
    if (flag != 0){
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0] var a)    // EXPECTED: regex variable declaration 'a' need at least one of type and initializer
    } else{
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}