// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Test<T> {
let width2: T
let length2: T

Test(width:Int64, length: Int64){
width2 = width // EXPECTED: regex type incompatible in this assignment
length2 = length // EXPECTED: regex type incompatible in this assignment
}

func area(): T {
return width2
}
}

func run(): Int64 {
var a: Int64 = 3
var b: Int64 = 4
let data: Test<Int32> = Test<Int32>(a, b)
var res: Int32
res = data.area()
if (res == 4) {
return 0
}
return 1
}
