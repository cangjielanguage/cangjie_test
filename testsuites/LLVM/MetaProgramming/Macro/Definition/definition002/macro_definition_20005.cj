// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define

from ast import ast.*

external macro test(a:Tokens,b:Tokens,c:Tokens):Tokens{ // EXPECTED: regex expect right input parameter list
    a
}

func main(){
    return 0
}
