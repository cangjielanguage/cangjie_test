// EXEC: %compiler %cmp_opt  %use_ast %f %pic_opt

package define

from ast import ast.*

external macro test(attr:Tokens):Tokens{
    quote(0)
}