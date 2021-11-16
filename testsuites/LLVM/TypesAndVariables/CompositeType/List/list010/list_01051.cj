// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently
func test(): Int64 {
    var a = [return 0]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
