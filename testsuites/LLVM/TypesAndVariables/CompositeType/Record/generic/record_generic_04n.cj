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
var res: Int32
var a: Int32 = 3
var b: Int64 = 4
let data: Data<Int32> = Data<Int32>(a,b) //EXPECTED:regex no matching constructor for call
return 0
}

