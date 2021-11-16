// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Exception{}

class B{
    init(a!:Int64 = throw A()){
        1
    }
}

func main(){
    B()
    return 0
}