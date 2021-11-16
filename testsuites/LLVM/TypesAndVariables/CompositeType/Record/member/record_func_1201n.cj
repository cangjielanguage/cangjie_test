// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data {
var width: Int32
var length: Int32

init(x:Int32, y: Int32){
width = x
length = y
}

operator func -(operand: Data): Data{
var left: Int32 = width - 1
var right: Int32 = length - 1
Data(left, right)
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
