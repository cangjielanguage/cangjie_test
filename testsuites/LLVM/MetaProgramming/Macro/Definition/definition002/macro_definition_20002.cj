// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define

from ast import ast.*

external Macro test(input:Tokens):Tokens{ // EXPECTED: regex modifier is not allowed here
    input
}

func main(){
    return 0
}
