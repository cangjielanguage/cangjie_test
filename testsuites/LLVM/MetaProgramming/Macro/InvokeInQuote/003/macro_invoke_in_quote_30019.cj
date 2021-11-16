// DEPENDENCE: define_30019.cj main_30019.cj

// EXEC: %compiler %cmp_opt define_30019.cj -c -backend-options="-fPIC" -o define_30019.%middle
// ERRCHECK: %compiler %cmp_opt %f -c ./define_30019.%middle %use_pic_ast -o use.%middle
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here



package use

import ast.*
import define_30019.*

var flag = 1
var count = 1

external macro X(attr:Tokens, input:Tokens):Tokens{
    if (flag != 0){
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0] external class A<T>{})
    } else{
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}