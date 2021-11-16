// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var a : Tokens = if(quote(true)){quote(1)}else{quote(2)} // EXPECTED: regex expected an expression of type 'Bool', but got
    return 0
}
