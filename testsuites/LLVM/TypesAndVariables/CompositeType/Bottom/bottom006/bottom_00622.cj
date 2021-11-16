// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// func test() : Bool = (return true) > (return false)

func test() : Bool {(return true) > (return false)} // EXPECTED: regex-auto invalid binary operator

func main(): Int64 {
    if (test()) {
        return 0
    }
    return 1
}
