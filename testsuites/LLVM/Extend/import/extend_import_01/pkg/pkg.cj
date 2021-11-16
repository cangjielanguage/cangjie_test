// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle  -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.A

func run(): Int64 {
  var res: Int64 = A().plus(A(),A())
  if ( res ==  3) {
    return 0
  } else {
    return 1
  }
}

func main(): Int64 {
  return run()
}
