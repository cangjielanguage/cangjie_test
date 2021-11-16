// DEPENDENCE: ../a
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00717a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package b
import a.*

record A{}
extend A <: a.update {
    operator func !():Bool {true}
}

func main():Int64{
    var i : A = A()
    if (!i) {
        return 0
    }
    return 1
}
