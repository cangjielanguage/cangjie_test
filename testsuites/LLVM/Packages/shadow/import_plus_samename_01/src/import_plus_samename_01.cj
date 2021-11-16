// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/ -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?redefinition of declaration 'Data'

import pkga.*

func run(): Int64 {
let v0: Int64 = 1
let x: pkga.Data = pkga.Data(v0,v0)
let y: pkga.Data<Int64> = pkga.Data<Int64>(v0,v0)
if (x != 0){
return 1
}
if (y != 0){
return 1
}
return 0
}

func main(): Int64 {
return run()
}
