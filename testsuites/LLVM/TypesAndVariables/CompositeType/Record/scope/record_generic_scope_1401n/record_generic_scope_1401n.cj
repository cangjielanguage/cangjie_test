// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj  pkgs/pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkgs.Data<T> // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
return run()
}
func run(): Int64 {
var res: Int32
var a: Int32 = 3
var b: Int32 = 4
let data: Data<Int32>= Data<Int32>(3, 4)
res = data.area()
if (res == 3){
return 0
}
return 1
}

