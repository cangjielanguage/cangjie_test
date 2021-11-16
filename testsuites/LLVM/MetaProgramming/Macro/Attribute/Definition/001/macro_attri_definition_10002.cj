// ERRCHECK: %compiler %cmp_opt  %use_ast %f %pic_opt

package define

from ast import ast.*

macro test(attr:Tokens,input:Tokens):Tokens{ // EXPECTED: regex expected 'external' modifier before 'macro'
    quote(0)
}