// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<Int32>(a:Int32){} // EXPECTED: regex-auto 'Int32' is keyword not identifier, you can use '`Int32`' instead

func main(){return 0}
