// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently


class A <: Exception{}

func test(input!:Int64 = throw A()) {}

func main(){
    test(input:1)
    return 0
}