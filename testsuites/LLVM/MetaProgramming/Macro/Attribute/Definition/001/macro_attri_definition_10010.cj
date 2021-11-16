// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output
// ASSERT: scan expect right input parameter list

package define

from ast import ast.*

external macro test(attr:Tokens,input!:Tokens=quote(0)):Tokens{
    input
}