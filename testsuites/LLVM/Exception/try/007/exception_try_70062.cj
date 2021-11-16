// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan argument type of nothing is not supported

class A <: Exception{}

func test(a:Int64){}

func main(){
    test(throw A())
    return 0
}