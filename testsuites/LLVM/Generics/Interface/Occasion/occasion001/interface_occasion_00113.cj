// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface I<T> {
static func foo<X>(a:X):X{
return a
}
}

func main(){
I.foo<Int32>(Int32(1)) // EXPECTED: regex generic type should be used with type argument
return 0
}
