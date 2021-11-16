// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{
var a : Bool = true // EXPECTED: regex-auto variable 'a' in interface should be immutable, use 'let' instead of 'var'
}

func main(){return 0}
