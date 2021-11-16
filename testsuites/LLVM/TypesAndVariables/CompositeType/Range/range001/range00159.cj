// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
let a = None<Int32>..None<Int32>:None<Int32> // EXPECTED: regex integer type is expected for start, stop and step in range expression
return 1
}
