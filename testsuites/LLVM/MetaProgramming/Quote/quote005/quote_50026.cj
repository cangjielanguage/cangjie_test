// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    for (i in quote(1..10)) { // EXPECTED: regex-auto wrong expression for for-in expression
        quote(1)
    }
    return 0
}
