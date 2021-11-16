// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/ -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?.. 'Data' has overload conflicts

import pkga.*

func run(): Int64 {
let v0: Int64 = 1
let x: Int64 = pkga.Data(v0,v0)
let y: Int64 = pkga.Data<Int64>(v0,v0)
if (x != 2){
return 1
}
if (y != 1){
return 1
}
return 0
}

func main(): Int64 {
return run()
}
