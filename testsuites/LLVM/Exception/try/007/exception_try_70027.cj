// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently


class A <: Exception{}


record B {
    init(a!:Int64=throw A()){
    }
}

func main(){
    B()
    return 0
}