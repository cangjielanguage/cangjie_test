// DEPENDENCE: ../pkga ../pkgb ../cfg-ast ../cfg-asta
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

package pkg
import pkga.*
import pkgb.*

extend A <: II{ // EXPECTED: regex imported type 'A' cannot extend import interface

	func plus(a: A, b: A) : Int64 {
	  foo() + foo2()
	}
}

func main(): Int64 {
  return A().plus(A(), A()) - 2
}
