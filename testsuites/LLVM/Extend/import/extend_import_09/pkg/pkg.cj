// DEPENDENCE: ../pkga ../pkgb ../pkgc ../cfg-ast ../cfg-asta
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt -c pkgc/pkgc.cj -o pkgc.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle pkgc.%middle -o %output 2>&1 | compare %f
// ASSERT: scan function 'plus' has overload conflicts
// ASSERT: scan function 'foo' has overload conflicts

package pkg
import pkga.A
import pkgb.I
import pkgc.I2


func main(): Int64 {
  return A().plus(A(), A()) - 2
}
