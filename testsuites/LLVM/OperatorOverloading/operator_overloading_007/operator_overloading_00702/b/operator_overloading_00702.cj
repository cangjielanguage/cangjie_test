// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00702a.cj -o ./a/operator_overloading_00702a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00702a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package b
import a.update

func main(): Int64{
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
