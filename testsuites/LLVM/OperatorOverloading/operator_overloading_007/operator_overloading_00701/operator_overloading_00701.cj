// DEPENDENCE: operator_overloading_00701a.cj
// EXEC: %compiler %cmp_opt %f operator_overloading_00701a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package operator_overloading_00701

interface update {
    operator func !():Bool
}

func main():Int64{
    var a = A()
    if (!a) {
        return 0
    }
    return 1
}