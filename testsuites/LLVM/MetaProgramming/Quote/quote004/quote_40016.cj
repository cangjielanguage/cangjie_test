// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    record A{ // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
        var a : Tokens = quote(a)
    }
    input
}

func main(){
    return 0
}
