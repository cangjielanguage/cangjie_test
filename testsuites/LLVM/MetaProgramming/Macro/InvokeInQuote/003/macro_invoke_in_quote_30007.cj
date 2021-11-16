// DEPENDENCE: define_30007.cj main_30007.cj

// EXEC: %compiler %cmp_opt define_30007.cj -c -backend-options="-fPIC" -o define_30007.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30007.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30007.%middle ./use.%middle %use_pic_ast main_30007.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan-begin first is true
// ASSERT: scan-next second is false
// ASSERT: scan-next second is false
package use

import ast.*
import define_30007.*

var flag = true
external macro Y(input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y @Y(1))
    } else{
        print("second is ${flag}\n")
        return quote(@A @A(1))
    }
}
