// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_40010.cj:9)
class A <: Exception{}


class B{
    func test(input!:Int64 = try{throw A()}
                //catch (_) {}
                finally{}
            ){
    }
}

func main(){
    B().test()
    return 0
}