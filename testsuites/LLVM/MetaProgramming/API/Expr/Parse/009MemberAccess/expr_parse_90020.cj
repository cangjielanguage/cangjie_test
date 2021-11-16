// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a..b)
   	try {
        let expr = ParseMemberAccess(input)
    } catch (e: IllegalArgumentException) {
        return 0
    }
    return 1
}
