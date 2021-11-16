// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data {
let width: Int32
let length: Int32

init(x:Int32, y: Int32){
width = x
length = y
}

static operator func -(operand: Data): Data{ // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
Data(operand.width-1, operand.length-1)
}
}

func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
var data: Data = Data(a, b)
var d1 = -data
var res1: Int32 = d1.width
var res2: Int32 = d1.length
if (res1 == 2 && res2 == 3) {
return 0
}
return 1
}
