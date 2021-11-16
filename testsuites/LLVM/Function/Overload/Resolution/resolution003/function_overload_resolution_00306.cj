// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}

func test(a:A*B):Int64{return 1}
func test(a:C*D):Int64{return 2}

func main(){
    if (test((E(),F())) == 2) {
        return 0
    }
    return 1
}