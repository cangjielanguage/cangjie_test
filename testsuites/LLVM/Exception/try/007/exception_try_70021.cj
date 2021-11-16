// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently


class A <: Exception{}


record B {
    B(input:Int64)
    {
        func test(a!:Int64 = throw A()) {}
        test()
    }
}

func main(){
    B(1)
    return 0
}