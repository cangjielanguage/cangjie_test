// DEPENDENCE: operator_overloading_00708a.cj
// EXEC: %compiler %cmp_opt %f operator_overloading_00708a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package operator_overloading_00708


func main():Int64{
    let a = A()
    a*a
    if (!(a*a)) {
        return 1
    }
    let b : D = B()
    if (!(b*b)) {
        return 2
    }
    let c = C()
    if (!(c*c)) {
        return 3
    }
    return 0

}
