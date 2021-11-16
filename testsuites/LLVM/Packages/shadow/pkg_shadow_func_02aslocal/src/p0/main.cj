// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo as goo // EXPECTED: regex-auto alias name 'goo' is conflicted with imported declaration name

external func goo(a: Int8) { return 1 } // EXPECTED: regex error.*function 'goo' has overload conflicts
external func goo(a: Int16) { return 2 } // EXPECTED: regex error.*function 'goo' has overload conflicts
external func goo(a: Int32) { return 3 } // EXPECTED: regex error.*function 'goo' has overload conflicts
external func goo(a: Int64) { return 4 } // EXPECTED: regex error.*function 'goo' has overload conflicts

func main(): Int64 {
    var a1 = goo(Int8(1)) 
    var a2 = goo(Int16(1)) 
    var a3 = goo(Int32(1))
    var a4 = goo(Int64(1))
    return 0
}

