// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

interface B{
    func foo():Unit{
        throw A()
    }
}

func main(){
    return 0
}