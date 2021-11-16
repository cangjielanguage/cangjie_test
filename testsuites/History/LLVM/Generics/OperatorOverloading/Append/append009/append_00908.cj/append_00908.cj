// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// ERRCHECK: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
package pkg908
import a.*

append<X> A<X> with update { // EXPECTED: regex-auto imported trait 'update' cannot be implemented for imported type 'A'
operator func +(a:A<X>,b:A<X>):Bool {true}
}

func main(): Int64 {
var a : A<Int8> = A<Int8>()
var b : A<Int8> = A<Int8>()
if (!(b+a)) {
return 1
}
return 0
}
