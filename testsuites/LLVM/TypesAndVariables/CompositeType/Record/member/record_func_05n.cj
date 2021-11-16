// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data<T> {
let width2: T
let length2: T

init(width:T, length: T){
width2 = width
length2 = length
}

func area(x: Int64): T {
width2 = x // EXPECTED: regex type incompatible in this assignment
return width2
}
}

func main(): Int64 {
return run()
}
func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
let data: Data<Int32> = Data<Int32>(a, b)
var res: Int32
res = data.area(b)
if (res == 4) {
return 0
}
return 1
}
