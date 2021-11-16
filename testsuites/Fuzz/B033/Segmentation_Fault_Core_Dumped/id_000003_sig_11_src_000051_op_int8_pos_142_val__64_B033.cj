// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

//define class
@pen class Object <: core.Object {}

func main(): Int64 {
    return 0
}
