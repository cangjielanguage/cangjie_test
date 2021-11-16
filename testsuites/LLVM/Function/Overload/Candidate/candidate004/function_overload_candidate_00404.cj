// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
open class B <: A{}
class C <: B{}

func test(a:A):Int64{1}
func test(a:B):Int64{2}

func main():Int64{
    if (test(C()) != 2) {
        return 1
    }
    return 0
}