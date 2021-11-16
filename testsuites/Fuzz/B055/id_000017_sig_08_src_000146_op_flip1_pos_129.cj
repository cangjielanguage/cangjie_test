// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump


func main(): Int64 {
   let a: int8 = 0 ** 6

    return 0
