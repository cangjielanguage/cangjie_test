// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var a = List<Int64>([Int32(1)].toArray()) // EXPECTED: regex no matching constructor for call
return 1
}

func main(): Int64 {
return test()
}
