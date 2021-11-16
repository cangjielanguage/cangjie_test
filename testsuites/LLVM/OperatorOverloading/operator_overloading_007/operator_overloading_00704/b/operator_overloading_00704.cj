// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00704a.cj -o ./a/operator_overloading_00704a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00704a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


package b
import a.*

func main():Int64{
    var i = A()
    if (!i) { // EXPECTED: regex expected an expression of type 'Bool', but got
        return 0
    }
    return 1
}
