// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f
// ASSERT: regex extra argument given for call
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

from ast import ast.*

func main() {
    var myArray1 = ArrayList<Token>()
    var myArray2 = ArrayList<Token>()
    var tks = Tokens(myArray1, myArray2)
    if (tks.size() != 0) {
        return 1
    }
    return 0
}
