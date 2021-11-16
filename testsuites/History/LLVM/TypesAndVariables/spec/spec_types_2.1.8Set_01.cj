// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A { }
class B { }

func main(){
    let setZero: Set<Int32> = #{} // empty Set
    let setOne: Set<Int32> = #{5, 6, 7, 5}  // setOne = #{5,6,7}, as duplicated element '5' is removed
    var setTwo = #{1.1, 2.1, 3.1, 4.1}  // The type of setTwo is inferred to be Set<Float64>.
//  var setThree = #{A(), B()}  // The type of setThree is inferred to be Set<Object> ,Unrealized
    let nestedSet = #{#{1, 2, 3, 4}, #{5, 6, 7}}  // The type of nestedSet is inferred to be Set<Set<Int64>>
    return 0
}

