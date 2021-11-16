// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data<T> {
let width: T
let length: T

Data(x:T, y: T){
width = x
length = y
}

operator func -(operand: Data): Data<Int32>{
var width :Int64 = 3
var length :Int64 = 4
Data<Int32>(width, length) // EXPECTED: regex no matching constructor for call
}
}

func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
var data: Data<Int32> = Data<Int32>(a, b)
var d1: Data<Int32> = -data
var res1: Int32 = d1.width
var res2: Int32 = d1.length
return 0
}
