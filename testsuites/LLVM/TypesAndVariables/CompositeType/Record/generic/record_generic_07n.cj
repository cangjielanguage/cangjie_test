// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data<T>{
let width: T
let length: T
init(widthin:T, lengthin: T){
width = widthin
length = lengthin
}
func area(): T {
var a: Int32 = 3
width = a //EXPECTED: regex type incompatible in this assignment
return width
}
}

func main(): Int64 {
return run()
}

func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
let data: Data = Data<Int32>(a, b)
return 0
}
