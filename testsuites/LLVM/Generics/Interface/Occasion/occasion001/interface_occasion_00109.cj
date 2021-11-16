// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T> {
static func foo():Int64{
return 1
}
}

func main(){
I.foo() // EXPECTED: regex generic type should be used with type argument
return 0
}
