// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
return run()
}

record Data<T>{
let width: T
let length: T = width // EXPECTED: regex variable 'width' is used before initialization
init(widthin:T, lengthin: T){
width = widthin
}
func area(): T {
return length
}
}

func run(): Int64 {
var res: Int32
var a: Int32 = 3
var b: Int32 = 4
let data: Data<Int32> = Data<Int32>(a, b)
res = data.area()
return 0
}
