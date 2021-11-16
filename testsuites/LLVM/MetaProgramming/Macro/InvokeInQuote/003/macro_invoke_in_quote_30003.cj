// DEPENDENCE: define_30003.cj main_30003.cj

// EXEC: %compiler %cmp_opt define_30003.cj -c -backend-options="-fPIC" -o define_30003.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f -c ./define_30003.%middle %use_pic_ast -o use.%middle 2>&1 | compare %f
// ASSERT: scan no matching function declaration for function call

package use

import ast.*
import define_30003.*

external macro Y(input:Tokens):Tokens{
    return quote(@Y[1](1))
}
