// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00720a.cj -o ./a/operator_overloading_00720a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00720a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package b
import a.*

interface update {
    operator func !(): Bool
}

extend Int32 <: update {
    operator func !(): Bool{ return true }
}

func main(): Int64 {
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
