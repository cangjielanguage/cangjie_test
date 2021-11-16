// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_40020.cj:9)
class A <: Exception{}


record B {
    B(input!:Int64= try{throw A()}finally{})
    {

    }
}

func main(){
    B()
    return 0
}