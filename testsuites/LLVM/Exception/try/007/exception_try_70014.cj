// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently


class A <: Exception{}


class B{
    B(input:Int64)
    {
        func foo(a!:Int64=throw A()){}
        foo()
    }
}

func main(){
    B(1)
    return 0
}