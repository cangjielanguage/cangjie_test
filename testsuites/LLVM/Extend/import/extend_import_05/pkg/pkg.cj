// DEPENDENCE: ../pkga ../pkgb ../cfg-ast ../cfg-asta
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj  -o pkgb.%middle && %copycharjs pkgb
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle  -o %output 
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*
import pkgb.*


func main(): Int64 {
  return A().plus(A(), A()) - 2
}
