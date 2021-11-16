// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data {
let width: Int32 = 2
}

func run(): Int64 {
let data: Data = Data1() // EXPECTED: regex undeclared identifier 'Data1'
var res = data.width
return 0
}

func main(): Int64 {
return run()
}

