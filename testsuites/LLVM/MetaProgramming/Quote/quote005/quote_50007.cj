// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var a : Tokens
    quote(a) = a // EXPECTED: regex illegal left value
    return 0
}
