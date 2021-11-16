// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<T>()
where T <: test // EXPECTED: regex undeclared type name 'test'
{}
func main(){return 0}
