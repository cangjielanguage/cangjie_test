// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo
import p2.foo

var foo = 1
func main(): Int64 {
    var a1 = foo
    var a2 = p0.foo
    var a3 = p1.foo // EXPECTED: regex error.*ambiguous match for assigning function 'foo' to variable
    var a4 = p2.foo
    if ( a1 != 1 ){
        return 1
    }
    return 0
}
