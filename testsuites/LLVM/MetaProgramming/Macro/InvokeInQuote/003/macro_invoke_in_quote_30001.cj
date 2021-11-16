// DEPENDENCE: define_30001.cj main_30001.cj

// EXEC: %compiler %cmp_opt define_30001.cj -c -backend-options="-fPIC" -o define_30001.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30001.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30001.%middle ./use.%middle %use_pic_ast main_30001.cj -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_30001.*

external macro Y(input:Tokens):Tokens{
    return quote(@X(1))
}
