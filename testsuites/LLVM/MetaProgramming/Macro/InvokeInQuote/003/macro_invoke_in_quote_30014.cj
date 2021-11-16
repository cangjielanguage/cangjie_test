// DEPENDENCE: define_30014.cj main_30014.cj

// EXEC: %compiler %cmp_opt define_30014.cj -c -backend-options="-fPIC" -o define_30014.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30014.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30014.%middle ./use.%middle %use_pic_ast main_30014.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan count is 11



package use

import ast.*
import define_30014.*

var flag = 5
var count = 1
external macro X(attr:Tokens, input:Tokens):Tokens{
    print("count is ${count}\n")
    print("flag is ${flag}\n")
    count = count + 1
    if (flag != 0){
        flag = flag - 1
        return quote(@X[0]@X[0](1))
    } else{
        input.dump()
        return quote(@B[0](1))
    }
}
