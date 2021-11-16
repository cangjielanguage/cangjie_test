// DEPENDENCE: define_30006.cj main_30006.cj

// EXEC: %compiler %cmp_opt define_30006.cj -c -backend-options="-fPIC" -o define_30006.%middle
// ERRCHECK: %compiler %cmp_opt %f -c ./define_30006.%middle %use_pic_ast -o use.%middle

package use

import ast.*
import define_30006.*

var flag = true
external macro Y(input:Tokens):Tokens{
    if (flag){
        print("first is ${flag}\n")
        flag = !flag
        return quote($(@Y(1)))   // EXPECTED: regex-auto macro's call and definition can not in one package
    } else{
        print("second is ${flag}\n")
        return quote($(@A(1)))
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace