// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<>(){} // EXPECTED: regex expected identifier here

func main(){return 0}
