// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data<T>{
let width2: T
let length2: T
init(){} // EXPECTED: regex the uninitialized member variable 'width2' is not initialized in the constructor of class or record
func area2(): T {
return width2
}
}

func run(): Int64 {
var res: Int32
let data: Data<Int32> = Data<Int32>()
res = data.area2()
return 0
}
