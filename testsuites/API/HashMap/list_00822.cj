// EXEC-PIPE-1: %compiler %stdx_cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

from std import collection.*
func test<T>(input:T){
    var a : HashMap<List<T>,List<T>> =HashMap<List<T>,List<T>>([([input],[input])]) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 1
}

func main(): Int64 {
    return 1
}
