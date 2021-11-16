// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -1.051000E\+01 -1.051000e\+01

func main(): Int64 {
var c : Float32 = -10.51
print(c.format("#E")+" "+c.format("e"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace