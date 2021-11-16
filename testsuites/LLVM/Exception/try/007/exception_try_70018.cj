// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_70018.cj:14
class A <: Exception{}

open class C{
    init(a:Int64){}
}

class B <: C{
    B(input:Int64)
    {
        super({throw A()}())
    }
}

func main(){
    B(1)
    return 0
}