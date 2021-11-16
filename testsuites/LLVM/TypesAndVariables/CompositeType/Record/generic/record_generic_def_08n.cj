// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data<_a1> { //EXPECTED: regex expected identifier here
let count: _a1

init(x: _a1){
count = x
}
}

func run(): Int64 {
var i: Int64 = 4
let data: Data<Int64> = Data<Int64>(i)
var res: Int64 = data.count
if (res == 4) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}

