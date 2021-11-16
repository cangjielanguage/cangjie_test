// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: scan 字            end

func main(): Int64 {
let f:Char = '字'
var s:Char=f
print(f.format("-15")+"end")

return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
