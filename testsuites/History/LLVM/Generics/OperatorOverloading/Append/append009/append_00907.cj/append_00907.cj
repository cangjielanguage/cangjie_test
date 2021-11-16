// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
record A<X>{}

trait update{
operator func +(a:This,b:This):Bool
}


append<X> A<X> with update {
operator func +(a:A<X>,b:X):Bool {false} // EXPECTED: regex-auto function '+' has no related trait

func main(): Int64 {
return 0
}
