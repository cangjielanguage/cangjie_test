// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test():Unit { while (return ()){return ()}}

func main(): Int64 {
    test()
    return 0
}
