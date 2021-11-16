// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f
// ASSERT: regex argument is mismatched with parameter type
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


from ast import ast.*

func main() {
    var myArray = ArrayList<Int32>()
    var tks = Tokens(myArray)
    if (tks.size() != 0) {
        return 1
    }
    return 0
}
