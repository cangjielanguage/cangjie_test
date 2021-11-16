// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{}
interface B<T> where T<:A{} // EXPECTED: regex generic type should be used with type argument

func main():Int64{
return 0
}
