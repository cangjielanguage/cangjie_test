// DEPENDENCE: 410.cj 410.cfg
// EXEC: %compiler %cmp_opt -c 410.cj -o 410.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f 410.%middle -o %output 2>&1 | compare %f

import test410.*

class A<T>{}

func main(): Int64 {
    var myList : List<A<test410.I<Int64>>> = [A<test410.X<Int64>>()] // EXPECTED: regex inconsistent element type for List literal
    return 0
}
