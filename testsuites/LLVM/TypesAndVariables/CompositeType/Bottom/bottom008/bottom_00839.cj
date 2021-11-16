// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a : Array<Array<Int64>> = [[1,2].toArray()].toArray()


// func test():Int64 = a[return 0][return 1]

func test():Int64 { a[return 0][return 1] } // EXPECTED: regex expression of Nothing type cannot appear here currently


func main(): Int64 {
    return test()
}
