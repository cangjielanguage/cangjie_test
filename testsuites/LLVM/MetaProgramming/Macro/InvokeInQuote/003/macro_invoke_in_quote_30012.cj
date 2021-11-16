// DEPENDENCE: define_30012.cj main_30012.cj

// EXEC: %compiler %cmp_opt define_30012.cj -c -backend-options="-fPIC" -o define_30012.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30012.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30012.%middle ./use.%middle %use_pic_ast main_30012.cj -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan-begin first flagY is true
// ASSERT: scan-next second flagY is false
// ASSERT: scan-next first flagX is true
// ASSERT: scan-next second flagX is false

package use

import ast.*
import define_30012.*

var flagX = true
external macro X(input:Tokens):Tokens{
    if (flagX){
        print("first flagX is ${flagX}\n")
        flagX = !flagX
        return quote(@X(1))
    } else{
        print("second flagX is ${flagX}\n")
        return quote(@B[0](1))
    }
}

var flagY = true
external macro X(attr:Tokens, input:Tokens):Tokens{
    if (flagY){
        print("first flagY is ${flagY}\n")
        flagY = !flagY
        return quote(@X[0](1))
    } else{
        print("second flagY is ${flagY}\n")
        return quote(@X(1))
    }
}
