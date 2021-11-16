// DEPENDENCE: ../pkga ../pkgb ../cfg-ast ../cfg-asta
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj  -o pkgb.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle  -o %output 2>&1 | compare %f


package pkg
import pkga.A
import pkgb.I


func main(): Int64 {
  return A().plus(A(), A()) - 2 //EXPECTED: regex is not a member of class
}
