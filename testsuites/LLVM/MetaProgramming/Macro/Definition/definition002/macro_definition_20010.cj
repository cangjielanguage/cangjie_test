// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define

from ast import ast.*

external macro(a:Tokens){a}// EXPECTED: regex expected macro name after 'macro'

func main(){
    return 0
}
