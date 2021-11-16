// ERRCHECK: %compiler %cmp_opt %use_ast %enable_macro %f -o %output

package define

from ast import ast.*

external macro test(input:Tokens):Tokens{
    input=Tokens() // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    Tokens()
}

func main(){
    return 0
}
