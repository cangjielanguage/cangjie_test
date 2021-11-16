// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}
interface B{}
class C <: A &B{}

func test(a:A):Int64{return 1}

func main(){
    func test(a:B):Int64{return 2}
    if (test(C()) == 2) {
        return 0
    }
    return 1
}