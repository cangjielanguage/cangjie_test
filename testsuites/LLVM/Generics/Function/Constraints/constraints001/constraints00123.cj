// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

func g<T>() where T <: A.B {} // EXPECTED: regex undeclared type name 'B'

func main(){return 0}
