// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here

var a : Int64 = 1

// func test() : Unit =  a = return

func test() : Unit {a = return} // EXPECTED: regex-auto expression of Nothing type cannot appear here currently

func main(): Int64 {
    test()
    return 0
}
