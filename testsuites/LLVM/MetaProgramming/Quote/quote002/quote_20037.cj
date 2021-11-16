// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output
// ASSERT: scan expected '(' or ')' to match in quote
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(""()
}

func main(){
    return 0
}
