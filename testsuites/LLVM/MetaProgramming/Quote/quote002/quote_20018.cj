// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for identifier
external macro test(input:Tokens):Tokens{
    quote(_a)
    quote(``) // EXPECTED:regex backquote identifier is empty
    quote(```) // EXPECTED:regex illegal backquote identifier
}

func main(){
    return 0
}
