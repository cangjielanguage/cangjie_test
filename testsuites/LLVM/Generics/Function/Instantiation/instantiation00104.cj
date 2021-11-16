// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
func test<T>(){}

func main(){
    test<>() // EXPECTED: regex expected type argument
    return 0
}
