// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data<T>{
let width: T
let length: T
init(widthin:T, lengthin: T){
width = widthin
length = lengthin
}
func area(): T {
return width
}
}
func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
let data: Data = Data<Int32>(a, b) // EXPECTED: regex generic type should be used with type argument
return 0
}

