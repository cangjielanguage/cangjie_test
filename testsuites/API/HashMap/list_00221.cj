// EXEC-PIPE-1: %compiler %stdx_cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

from std import collection.*
func test<T>(i: T): Int64 {
    var a : List<HashMap<T,T>> = [HashMap<T,T>([(i,i)])] // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b : List<HashMap<T,T>> = ListHashMap<T,T>>([HashMap<T,T>([(i,i)])].toArray()) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c : List<HashMap<T,T>> = ListHashMap<T,T>>(HashMap<T,T>[](1,HashMap<T,T>([(i,i)]))) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
