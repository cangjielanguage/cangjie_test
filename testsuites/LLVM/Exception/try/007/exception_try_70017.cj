// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan initialization expression of Nothing type is not supported currently

class A <: Exception{}

class B{
    B(input:Int64)
    {
        var a = throw A()
    }
}

func main(){
    B(1)
    return 0
}