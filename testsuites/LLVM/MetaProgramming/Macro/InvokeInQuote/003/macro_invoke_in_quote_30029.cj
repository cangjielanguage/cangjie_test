// DEPENDENCE: define_30029.cj main_30029.cj

// EXEC: %compiler %cmp_opt define_30029.cj -c -backend-options="-fPIC" -o define_30029.%middle
// ERRCHECK: %compiler %cmp_opt %f -c ./define_30029.%middle %use_pic_ast -o use.%middle



package use

import ast.*
import define_30029.*

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
        return quote($(@Y[0](1)))  // EXPECTED: regex-auto macro's call and definition can not in one package
    }
}
var flagY = 1
external macro Y(attr:Tokens, input:Tokens):Tokens{
    if (flagY != 0){
        print("first is ${flagY}\n")
        flagY = flagY - 1
        return quote(@Y[0](1))
    } else{
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flagY}\n")
        return quote($(@B[0](1)))
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace