// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class C<T> <: List<T>{} // EXPECTED: regex-auto super class 'List' is not inheritable, use 'open' modifier instead

func main(): Int64 {
return 1
}
