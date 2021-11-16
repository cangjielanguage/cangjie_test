// DEPENDENCE: define_30002.cj main_30002.cj

// EXEC: %compiler %cmp_opt define_30002.cj -c -backend-options="-fPIC" -o define_30002.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30002.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30002.%middle ./use.%middle %use_pic_ast main_30002.cj -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_30002.*

external macro Y(input:Tokens):Tokens{
    return quote(@B[1](1))
}
