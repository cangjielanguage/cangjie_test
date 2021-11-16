// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p3
external import p1.C // EXPECTED: regex redefinition of declaration 'C'
external import p2.C // EXPECTED: regex redefinition of declaration 'C'
external import p1.f // EXPECTED: regex-not error
external import p2.f // EXPECTED: regex-not error
external class C{} // EXPECTED: regex redefinition of declaration 'C'
external func f(a: Int64) {} // EXPECTED: regex-not error

func main(): Int64 {
    return 0
}
