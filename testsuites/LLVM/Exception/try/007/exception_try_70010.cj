// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently


class A <: Exception{}


class B{
    func test(input!:Int64 = throw A()){
    }
}

func main(){
    B().test()
    return 0
}