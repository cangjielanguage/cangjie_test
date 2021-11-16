// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    quote(match (1) {
    case x : Int64 => 1
    case None(Int64) => 2
    case a => 3
    case _ if (true) => 4
    })
}

func main(){
    return 0
}
