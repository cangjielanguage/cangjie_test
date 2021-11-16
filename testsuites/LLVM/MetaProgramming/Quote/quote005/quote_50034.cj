// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var a : Tokens = match (1) {
        case _ if (quote(true)) => quote(1) // EXPECTED: regex expected an expression of type 'Bool', but got
        case _ => quote(0)
    }
    return 0
}
