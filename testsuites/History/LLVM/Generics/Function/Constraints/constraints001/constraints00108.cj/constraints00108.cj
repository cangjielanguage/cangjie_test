// ERRCHECK: %compiler %cmp_opt %f -o %output

trait update{}
func g<T>()where T:update {} // EXPECTED: regex-auto expected '<:'
func main(){return 0}

// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped