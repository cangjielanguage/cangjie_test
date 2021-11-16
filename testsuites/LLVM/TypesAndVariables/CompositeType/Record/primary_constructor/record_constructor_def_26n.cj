// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Test<T> {
let width2: T
let length2: T 

Test(width:T, length: T){ // EXPECTED: regex the uninitialized member variable 'length2' is not initialized in the constructor of class or record
width2 = width
}

func area(): T {
return width2
}
}

func run(): Int64 {
var a: Int64 = 3
var b: Int64 = 4
let data: Test<Int64> = Test<Int64>(a, b)
return 0
}
