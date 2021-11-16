// DEPENDENCE: ../a 
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00720a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output 
// EXEC: %run %run_opt %output  %run_args

package b
import a.update
class A {}
interface update {
    operator func !(): Bool
}
extend A <: update {
    operator func !(): Bool{ return true }
}

func main(): Int64 {
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
