// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00706a.cj -o ./a/operator_overloading_00706a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00706a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package b
import a

func main():Int64{
    var i : a.A = a.A()
    if (!i) {
        return 0
    }
    return 1
}
