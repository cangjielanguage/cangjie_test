// DEPENDENCE: ../a 
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00721a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package b
import a.A
import a.update

func main():Int64{
    var i : A = A()
    if (!i) {
        return 0
    }
    return 1
}
