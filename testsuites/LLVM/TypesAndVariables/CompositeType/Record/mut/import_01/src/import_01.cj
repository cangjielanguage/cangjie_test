// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkga/a.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/b.cj pkga.%middle -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt src/%n.cj pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args



import pkga.*
import pkgb.*

func main() {
  var b = Boo()
  b.c(99)
  var c = Coo()
  c.c()
  return (b.a - 99 + c.a - 5)
}
