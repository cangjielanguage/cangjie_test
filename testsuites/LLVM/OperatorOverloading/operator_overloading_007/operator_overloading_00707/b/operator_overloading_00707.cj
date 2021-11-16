// DEPENDENCE: ../a importcfg
// EXEC-PIPE-1: %compiler %cmp_opt -c ./a/operator_overloading_00707a.cj -o ./a/operator_overloading_00707a.%middle 2>&1 | compare %f
// ASSERT: regex interface 'update' must be external, external type cannot extend internal interface

package b
import a

func main():Int64{
    var i : a.A = a.A()
    if (!i) { 
        return 0
    }
    return 1
}
