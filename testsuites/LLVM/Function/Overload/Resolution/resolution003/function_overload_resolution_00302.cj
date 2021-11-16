// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}
open class B <: A{}
class C <: B{}

func test(a:A):Int64{return 1}
func test(a:B):Int64{return 2}

func main(){
    if (test(C()) == 2) {
        return 0
    }
    return 1
}