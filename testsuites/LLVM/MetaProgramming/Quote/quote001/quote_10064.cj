// EXEC-PIPE-1 %compiler %cmp_opt -i ast.cfg %use_ast %f -o %output 2>&1 | compare %f
// ASSERT: scan expected ')'
package define

from ast import ast.*

external macro test(input:Tokens):Tokens{
    quote(\)
}

func main(){
    return 0
}
