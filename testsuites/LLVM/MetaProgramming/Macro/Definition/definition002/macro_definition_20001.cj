// ERRCHECK: %compiler %cmp_opt %use_ast %f %enable_macro -o %output

package define

from ast import ast.*

macro test(input:Tokens):Tokens{ //EXPECTED: regex expected 'external' modifier before 'macro'
    input
}

func main(){
    return 0
}
