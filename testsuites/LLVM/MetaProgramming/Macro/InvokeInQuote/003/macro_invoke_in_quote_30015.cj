// DEPENDENCE: define_30015.cj main_30015.cj

// EXEC: %compiler %cmp_opt define_30015.cj -c -backend-options="-fPIC" -o define_30015.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30015.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30015.%middle ./use.%middle %use_pic_ast main_30015.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan count is 11



package use

import ast.*
import define_30015.*

var flag = 5
var count = 1
external macro X(input:Tokens):Tokens{
    print("count is ${count}\n")
    print("flag is ${flag}\n")
    count = count + 1
    if (flag != 0){
        flag = flag - 1
        return quote(@X@X(1))
    } else{
        input.dump()
        return quote(@B[0](1))
    }
}