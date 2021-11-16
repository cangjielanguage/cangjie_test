// ERRCHECK: %compiler %cmp_opt %use_ast %enable_macro %f -o %output

package define

from ast import ast.*

external macro test(input:Tokens):Tokens{
    enum E{e}  // EXPECTED: regex enum type must be toplevel

    Tokens()
}

func main(){
    return 0
}
