// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum E<T> where T<: List<Int64>{
e(T)
}

func main(): Int64 {
e<List<Int32>>([1]) // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
