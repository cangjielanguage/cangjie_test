// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}
class B <: A{}

func test(a:A):Int64{return 1}
func test(a:B):Int64{return 2}

func main(){
    if (test(B()) == 2) {
        return 0
    }
    return 1
}