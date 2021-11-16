// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan argument type of nothing is not supported

class A <: Exception{}

open class C{
    init(a:Int64){}
}

class B <: C{
    B(input:Int64)
    {
        super(throw A())
    }
}

func main(){
    B(1)
    return 0
}