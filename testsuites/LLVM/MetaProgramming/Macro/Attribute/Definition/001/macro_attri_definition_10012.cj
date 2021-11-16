// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output
// ASSERT: scan cannot convert an integer literal to type 'Class-Tokens'

package define

from ast import ast.*

external macro test(attr:Tokens,input:Tokens){
    1
}
