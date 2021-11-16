// DEPENDENCE: define_30013.cj main_30013.cj

// EXEC: %compiler %cmp_opt define_30013.cj -c -backend-options="-fPIC" -o define_30013.%middle
// EXEC: %compiler %cmp_opt %f -c ./define_30013.%middle %use_pic_ast -o use.%middle
// EXEC: %compiler %cmp_opt  ./define_30013.%middle ./use.%middle %use_pic_ast main_30013.cj -o %output
// EXEC: %run %run_opt %output



package use

import ast.*
import define_30013.*

external macro X(input:Tokens):Tokens{
    return quote(1+1)
}

external func x(){}
