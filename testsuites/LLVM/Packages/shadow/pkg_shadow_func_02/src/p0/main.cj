// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo
import p2.foo

func main(): Int64 {
    var a1 = foo(Int8(1)) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    var a2 = foo(Int16(1)) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    var a3 = foo(Int32(1)) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    var a4 = foo(Int64(1)) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    return 0
}