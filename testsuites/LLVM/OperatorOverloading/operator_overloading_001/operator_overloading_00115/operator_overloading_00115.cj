// DEPENDENCE: operator_overloading_00115a 
// EXEC: %compiler %cmp_opt -c operator_overloading_00115a/operator_overloading_00115a.cj -o operator_overloading_00115a.%middle
// EXEC: %compiler %cmp_opt %f operator_overloading_00115a.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import operator_overloading_00115a.*
func main():Int64{
    let a1 = operator_overloading_00115a.A()
    let a2 = operator_overloading_00115a.A()
    let b1 = operator_overloading_00115a.B()
    let b2 = operator_overloading_00115a.B()
    let c1 : operator_overloading_00115a.C = operator_overloading_00115a.D()
    let c2 : operator_overloading_00115a.C = operator_overloading_00115a.D()
    operator_overloading_00115a.A.test()
    return Int64((a1+a2)+(b1+b2)+(c1+c2))
}
