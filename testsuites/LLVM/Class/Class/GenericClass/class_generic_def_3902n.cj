// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

class Data<T,V>{
let width: T
let length: V
init(widthin: T){
width = widthin
length = width //EXPECTED: regex type incompatible in this assignment
}

}

func run(): Int64 {
var a: Int32 = 3
let data: Data = Data<Int32>(a)
return 0
}
