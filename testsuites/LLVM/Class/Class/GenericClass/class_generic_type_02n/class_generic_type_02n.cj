// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle  -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkgs.Data<T> // EXPECTED: regex 'Data' is not accessible in package 'pkgs'

func run(): Int64 {
var i: Int32 = 4
let data: Data<Int32> = Data<Int32>(i)
var res: Int64 = data.count
return 0
}

func main(): Int64 {
return run()
}
