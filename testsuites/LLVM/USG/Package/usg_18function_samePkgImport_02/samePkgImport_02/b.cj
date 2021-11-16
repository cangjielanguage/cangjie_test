// DEPENDENCE: ./a.cj
// EXEC: %compiler %cmp_opt %f a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package samePkgImport_02

class B {}
var a = samePkgImport_02.A()

func main(): Int64{return 0}