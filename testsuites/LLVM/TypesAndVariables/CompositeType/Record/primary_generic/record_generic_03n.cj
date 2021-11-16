// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
return run()
}

record Data<T>{
let width: T
let length: T
Data(widthin:T, lengthin: T){
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
let data: Data<Int32> = Data(3,4)
return 0
}

