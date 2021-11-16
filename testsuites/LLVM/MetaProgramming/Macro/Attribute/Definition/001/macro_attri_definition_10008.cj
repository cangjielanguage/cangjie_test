// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output
// ASSERT: scan macro declaration must have macro body

package define

from ast import ast.*

external macro test(attr:Tokens,input:Tokens):Tokens