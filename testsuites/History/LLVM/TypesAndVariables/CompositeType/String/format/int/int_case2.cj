// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex end -20

func main(): Int64 {
var c : Int32 = -20
print("end"+c.format("+4"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace