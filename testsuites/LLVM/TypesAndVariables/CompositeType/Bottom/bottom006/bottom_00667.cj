// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto integer type is expected for start, stop and step in range expression

// func test() = (return 1..10) .. (return 2..10): (return 3..10)

func test() { (return (1..10)) .. (return (2..10)): (return (3..10)) }


func main(): Int64 {
    for (i in test()) {
        if (i == 1) {
            return 0
        }
    }
    return 1
}


