// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex start         2.0011999512e\+02

func main(): Int64 {
var c : Float32 = 200.12
print("start"+c.format("#25.10e"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
