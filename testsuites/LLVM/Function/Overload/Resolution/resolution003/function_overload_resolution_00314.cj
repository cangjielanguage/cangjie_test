// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C1 {}
open class C2 <: C1 {}
class C3 <: C2 {}
func f(a: C1, b: C2, c: C1): Int64{return 1}
func f(a: C3, b: C3, c: C2): Int64{return 2}
func f(a: C3, b: C2, c: C1): Int64{return 3}



func main(){
    var x = f(C3(), C3(), C3()) // func f(a: C3, b: C3, c: C2) {...}
    if (x == 2) {
        return 0
    }
    return 1
}