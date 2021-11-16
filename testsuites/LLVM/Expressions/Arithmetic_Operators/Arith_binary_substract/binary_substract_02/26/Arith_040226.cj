// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
let a: Float64 = -1.8e308 - 0.1 // EXPECTED: regex-auto the number '-1.8e308' exceeds the value range of type 'Float64'
return 0
}
