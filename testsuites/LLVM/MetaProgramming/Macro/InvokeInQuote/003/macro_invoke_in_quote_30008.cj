// DEPENDENCE: define_30008.cj main_30008.cj

// EXEC: %compiler %cmp_opt define_30008.cj -c -backend-options="-fPIC" -o define_30008.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f -c ./define_30008.%middle %use_pic_ast -o use.%middle 2>&1 | compare %f
// ASSERT: scan no matching function declaration for function call

package use

import ast.*
import define_30008.*

var flag = true
external macro Y(attr:Tokens, input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y(1))
    } else{
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}
