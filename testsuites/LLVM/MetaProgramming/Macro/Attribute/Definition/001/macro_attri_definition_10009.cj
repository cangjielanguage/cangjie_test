// EXEC-PIPE-1: %compiler %cmp_opt %use_ast %f 2>&1 | compare %f
// ASSERT: scan expected '}'

package define

from ast import ast.*

external macro test(attr:Tokens,input:Tokens):Tokens{
