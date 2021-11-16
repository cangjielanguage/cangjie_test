// ERRCHECK: %compiler %cmp_opt %f %pic_opt
// ASSERT: scan type of macro body is incompatible with return type

package define

from ast import ast.*

external macro test(attr:Tokens,input:Tokens):Tokens{

}