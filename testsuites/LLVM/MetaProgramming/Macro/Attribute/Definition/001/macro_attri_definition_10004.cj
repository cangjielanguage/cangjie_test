// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output

package define

from ast import ast.*

external macro test(attr:Int64,input:Int64):Tokens{ // EXPECTED: regex illegal macro param type, must be Tokens
    quote(0)
}