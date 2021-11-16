// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tks = Tokens()
    if (tks.size() != 0) {
        return 1
    }
    return 0
}
