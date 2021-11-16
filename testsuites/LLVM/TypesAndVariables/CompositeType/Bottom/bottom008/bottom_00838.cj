// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a : Array<Int64> = [1,2].toArray()


// func test():Int64 = a[return 0]

func test():Int64 { a[return 0] } // EXPECTED: regex expression of Nothing type cannot appear here currently


func main(): Int64 {
    return test()
}
