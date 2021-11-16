// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
func test<A,B>(){}

func main(){
    test<Int32,Int32,Int32>() // EXPECTED: regex type argument's number does not match type parameter's number
    return 0
}
