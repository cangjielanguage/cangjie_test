// DEPENDENCE: define_30028.cj main_30028.cj

// EXEC: %compiler %cmp_opt define_30028.cj -c -backend-options="-fPIC" -o define_30028.%middle
// ERRCHECK: %compiler %cmp_opt %f -c ./define_30028.%middle %use_pic_ast -o use.%middle



package use

import ast.*
import define_30028.*

var flag = 1
var count = 1

external macro X(attr:Tokens, input:Tokens):Tokens{
    if (flag != 0){
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0](1))
    } else{
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}

external var x = quote($(@X[0](0))) // EXPECTED: regex-auto macro's call and definition can not in one package

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace