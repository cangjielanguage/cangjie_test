// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here

// func test() : Int64 = return 10 << return 2

func test() : Int64 {return 10 << return 2}

func main(): Int64 {
    return test() - 2
}
