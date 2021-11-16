// DEPENDENCE: define_30010.cj main_30010.cj

// EXEC: %compiler %cmp_opt define_30010.cj -c -backend-options="-fPIC" -o define_30010.%middle
// ERRCHECK: %compiler %cmp_opt %f -c ./define_30010.%middle %use_pic_ast -o use.%middle

package use

import ast.*
import define_30010.*

var flag = true
external macro Y(attr:Tokens, input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote($(@Y[0](1)))  // EXPECTED: regex-auto macro's call and definition can not in one package
    } else{
        print("second is ${flag}\n")
        return quote($(@B[0](1)))
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace