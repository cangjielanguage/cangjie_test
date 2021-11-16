// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// func test() : Bool = (return true) > (return false)

func test() : Bool {(return true) > (return false)}

func main(): Int64 {
    if (test()) {
        return 0
    }
    return 1
}
