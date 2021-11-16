// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


open class A{}
open class D <: A{}
open class G <: D{}

open class B{}
open class E <: B{}
open class H <: E{}

open class C{}
open class F <: C{}
open class I <: F{}

func test(a:A*B*C):Int64{return 1}
func test(a:D*E*F):Int64{return 2}
func test(a:G*H*I):Int64{return 3}

func main(){
    if (test((G(),H(),I())) == 3) {
        return 0
    }
    return 1
}