// DEPENDENCE: ../a 
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00703a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package b
import a.*

func main():Int64{
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
