// DEPENDENCE: define_30004.cj main_30004.cj

// EXEC: %compiler %cmp_opt define_30004.cj -c -backend-options="-fPIC" -o define_30004.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f -c ./define_30004.%middle %use_pic_ast -o use.%middle 2>&1 | compare %f
// ASSERT: scan macro's call and definition can not in one package

package use

import ast.*
import define_30004.*

external macro Y(input:Tokens):Tokens{
    return @Y(1)
}
