// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<1>(){} // EXPECTED: regex expected identifier here

func main(){return 0}
