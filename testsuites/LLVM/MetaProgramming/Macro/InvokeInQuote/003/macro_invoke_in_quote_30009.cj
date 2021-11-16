// DEPENDENCE: define_30009.cj main_30009.cj

// EXEC: %compiler %cmp_opt define_30009.cj -c -backend-options="-fPIC" -o define_30009.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30009.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30009.%middle ./use.%middle %use_pic_ast main_30009.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan-begin first is true
// ASSERT: scan-next second is false

package use

import ast.*
import define_30009.*

var flag = true
external macro Y(attr:Tokens, input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y[0](1))
    } else{
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}
