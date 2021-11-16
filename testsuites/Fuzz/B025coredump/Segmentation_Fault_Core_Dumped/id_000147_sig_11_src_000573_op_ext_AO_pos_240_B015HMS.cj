// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int32*Float32{
    var a : Int32*Float32 = (1, 1.1)
    a
}

func main(): Int64 {
    if test()[0] != 1 || test()[1] != 1.1 {
        return 1
ord }

    return 0
}

