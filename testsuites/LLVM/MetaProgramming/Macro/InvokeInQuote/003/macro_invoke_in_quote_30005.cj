// DEPENDENCE: define_30005.cj main_30005.cj

// EXEC: %compiler %cmp_opt define_30005.cj -c -backend-options="-fPIC" -o define_30005.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30005.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30005.%middle ./use.%middle %use_pic_ast main_30005.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan first is true
// ASSERT: scan second is false
package use

import ast.*
import define_30005.*

var flag = true
external macro Y(input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y(1))
    } else{
        print("second is ${flag}\n")
        return quote(@A(1))
    }
}
