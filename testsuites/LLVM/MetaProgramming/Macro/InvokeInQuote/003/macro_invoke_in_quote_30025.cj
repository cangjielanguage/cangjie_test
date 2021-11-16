// DEPENDENCE: define_30025.cj main_30025.cj

// EXEC: %compiler %cmp_opt define_30025.cj -c -backend-options="-fPIC" -o define_30025.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30025.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30025.%middle ./use.%middle %use_pic_ast main_30025.cj -o %output
// EXEC: %run %run_opt %output



package use

import ast.*
import define_30025.*

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

external func test(){
    var a = quote(@X[0](0))
    a.dump()
}