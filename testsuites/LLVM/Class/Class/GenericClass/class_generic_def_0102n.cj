// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Data {
let count: T // EXPECTED: regex undeclared type name 'T'

init(x: T){ // EXPECTED: regex undeclared type name 'T'
count = x
}
}

func run(): Int64 {
var i: Int64 = 4
let data: Data = Data(i)
var res: Int64 = data.count
if (res == 4) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}

