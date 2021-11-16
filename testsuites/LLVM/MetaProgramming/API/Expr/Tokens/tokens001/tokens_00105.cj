// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 

from ast import ast.*

func main() {
    var myArray = ArrayList<Token>()
    var tks = Tokens(myArray)
    if (tks.size() != 0) {
        return 1
    }
    return 0
}
