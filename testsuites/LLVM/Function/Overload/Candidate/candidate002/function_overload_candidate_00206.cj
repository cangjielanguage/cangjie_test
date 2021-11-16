// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package this // EXPECTED: regex-auto 'this' is keyword not identifier, you can use '`this`' instead

interface this{} // EXPECTED: regex-auto 'this' is keyword not identifier, you can use '`this`' instead

class this{} // EXPECTED: regex-auto 'this' is keyword not identifier, you can use '`this`' instead

func main():Int64{
    return 1
}