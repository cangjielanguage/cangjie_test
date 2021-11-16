// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00722a.cj -o ./a/operator_overloading_00722a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00722a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package b
import a.*

extend a.A <: a.update{ // EXPECTED: regex imported type 'A' cannot extend import interface
    operator func !():Bool {true}
}

func main():Int64{
    var i : a.A = a.A()
    if (!i) {
        return 0
    }
    return 1
}
