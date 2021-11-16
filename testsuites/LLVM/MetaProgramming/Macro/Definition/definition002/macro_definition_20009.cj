// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output
// ASSERT: scan type of macro body is incompatible with return type

package define

from ast import ast.*

external macro test(a:Tokens){}

func main(){
    return 0
}
