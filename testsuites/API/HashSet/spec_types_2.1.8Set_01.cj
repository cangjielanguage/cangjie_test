// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class A { }
class B { }

func main(){
    let setZero: HashSet<Int32> = HashSet<Int32>() // empty Set
    let setOne: HashSet<Int32> =HashSet<Int32>([5, 6, 7, 5])// setOne = #{5,6,7}, as duplicated element '5' is removed
    var setTwo =HashSet<Float64>([1.1, 2.1, 3.1, 4.1])  // The type of setTwo is inferred to be Set<Float64>.
    return 0
}

