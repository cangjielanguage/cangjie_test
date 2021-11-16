// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo as goo
import p2.foo as goo

func main(): Int64 {
    var a1 = goo(Int8(1)) // EXPECTED: regex error.*ambiguous match for function call 'goo'
    var a2 = goo(Int16(1)) // EXPECTED: regex error.*ambiguous match for function call 'goo'
    var a3 = goo(Int32(1)) // EXPECTED: regex error.*ambiguous match for function call 'goo'
    var a4 = goo(Int64(1)) // EXPECTED: regex error.*ambiguous match for function call 'goo'
    return 0
}

