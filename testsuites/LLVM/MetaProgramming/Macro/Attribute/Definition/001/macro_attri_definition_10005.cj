// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output

package define

from ast import ast.*

external macro test(attr:Tokens,input:Tokens,x:Tokens):Tokens{ // EXPECTED: regex expect right input parameter list
    quote(0)
}